import 'package:fitbit/src/features/auth/data/datasources/remote_datasource.dart';
import 'package:fitbit/src/features/auth/data/repositories/firebase_authentication_repository.dart';
import 'package:fitbit/src/features/auth/domain/repositories/authentication_repository.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_facebool_use_case.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_gmail_use_case.dart';
import 'package:fitbit/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initAppModule() async {
  // Bloc
  serviceLocator
      .registerFactory(() => AuthCubit(serviceLocator(), serviceLocator()));

  // UseCases
  serviceLocator
      .registerLazySingleton(() => SignInWithGmailUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => SignInWithFacebookUseCase(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<AuthenticationRepository>(
      () => FirebaseAuthenticationRepository(serviceLocator()));

  // DataSources
  // remoteDataSources
  serviceLocator
      .registerLazySingleton<RemoteDataSoucre>(() => RemoteDataSourceImpl());
}
