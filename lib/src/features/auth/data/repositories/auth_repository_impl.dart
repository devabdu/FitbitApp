import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/network/network_info.dart';
import 'package:fitbit/src/core/utils/errors/exceptions.dart' as exception;
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/data/datasources/remote_datasource.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSoucre remoteDataSoucre;
  final NetworkInfo networkInfo;

  const AuthRepositoryImpl(this.remoteDataSoucre, this.networkInfo);

  @override
  Future<Either<Failure, void>> createUserInfo(
      UserInfoParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.createUserInfo(parameters);
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      GetUserInfoParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.getUserInfo(parameters);
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      SignUpParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSoucre.signUpWithEmailAndPassword(parameters);
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSoucre.signInWithEmailAndPassword(parameters);
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.signInWithGoogle();
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.signInWithFacebook();
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.resetPassword(email);
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSoucre.signOut();
        return Right(response);
      } on exception.FirebaseException {
        return Left(FirebaseFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
