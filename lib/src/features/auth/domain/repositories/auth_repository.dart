import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> createUserInfo(UserInfoParameters parameters);
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      SignUpParameters parameters);
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters);
  Future<Either<Failure, void>> signOut();
  //not handled yet>>>>>
  Future<User?> signInWithGmail();
  Future<void> signOutWithGmail();
  Future<void> signInWithFacebook();
}
