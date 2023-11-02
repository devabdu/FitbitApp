import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/maps/maps.dart';
import 'package:fitbit/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_facebook_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;
  final ResetPasswordUseCase _forgotPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  LoginCubit(
    this._signInWithEmailAndPasswordUseCase,
    this._signInWithGoogleUseCase,
    this._signInWithFacebookUseCase,
    this._signOutUseCase,
    this._forgotPasswordUseCase,
  ) : super(LoginInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());

    final response = await _signInWithEmailAndPasswordUseCase(
        SignInParameters(email: email, password: password));

    emit(response.fold(
      (failure) => SignInError(error: Maps.mapFailureToMsg(failure)),
      (r) => SignInSuccess(),
    ));
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    emit(SignInLoading());

    final response = await _signInWithGoogleUseCase(const NoParameters());

    emit(response.fold(
      (failure) => SignInError(error: Maps.mapFailureToMsg(failure)),
      (r) => SignInSuccess(),
    ));
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    emit(SignInLoading());

    final response = await _signInWithFacebookUseCase(const NoParameters());

    emit(response.fold(
      (failure) => SignInError(error: Maps.mapFailureToMsg(failure)),
      (r) => SignInSuccess(),
    ));
  }

  Future<void> forgotPassword(String email) async {
    emit(ResetPasswordLoading());

    final response = await _forgotPasswordUseCase(email);

    emit(response.fold(
      (failure) => ResetPasswordError(error: Maps.mapFailureToMsg(failure)),
      (r) => ResetPasswordSuccess(),
    ));
  }

  Future<void> signOut() async {
    emit(SignOutLoading());

    final response = await _signOutUseCase(const NoParameters());

    emit(response.fold(
      (failure) => SignOutError(error: Maps.mapFailureToMsg(failure)),
      (r) => SignOutSuccess(),
    ));
  }
}
