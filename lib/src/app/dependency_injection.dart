import 'package:fitbit/src/app/bloc_observer.dart';
import 'package:fitbit/src/core/network/network_info.dart';
import 'package:fitbit/src/features/auth/data/datasources/remote_datasource.dart';
import 'package:fitbit/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_facebook_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/login_controller/login_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/register_controller/register_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/user_controller/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final serviceLocator = GetIt.instance;

Future<void> initAppModule() async {
  // Bloc
  serviceLocator.registerFactory(() => LoginCubit(serviceLocator(),
      serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()));
  serviceLocator
      .registerFactory(() => RegisterCubit(serviceLocator(), serviceLocator()));

  serviceLocator.registerFactory(() => UserCubit(serviceLocator()));

  // UseCases
  serviceLocator
      .registerLazySingleton(() => CreateUserInfoUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetUserInfoUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SignUpWithEmailAndPasswordUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SignInWithEmailAndPasswordUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => SignInWithGoogleUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => SignInWithFacebookUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => ResetPasswordUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SignOutUseCase(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(), serviceLocator()));

  // remoteDataSources
  serviceLocator
      .registerLazySingleton<RemoteDataSoucre>(() => RemoteDataSourceImpl());

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: serviceLocator()));
  // External
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton(() => AppBlocObserver());

  //workouts
// serviceLocator.registerLazySingleton<WorkoutRepository>(() => null)
}

void initBlocObserver() {
  Bloc.observer = serviceLocator<AppBlocObserver>();
}
