import 'package:fitbit/src/features/auth/data/datasources/remote_datasource.dart';
import 'package:fitbit/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_facebool_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_gmail_usecase.dart';
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
  serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(),));

  // DataSources
  // remoteDataSources
  serviceLocator
      .registerLazySingleton<RemoteDataSoucre>(() => RemoteDataSourceImpl());
}
