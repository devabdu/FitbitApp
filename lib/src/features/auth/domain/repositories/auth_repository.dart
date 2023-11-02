import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> createUserInfo(UserInfoParameters parameters);
  Future<Either<Failure, UserEntity>> getUserInfo(
      GetUserInfoParameters parameters);
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      SignUpParameters parameters);
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters);
  Future<Either<Failure, User?>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithFacebook();
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> signOut();
}
