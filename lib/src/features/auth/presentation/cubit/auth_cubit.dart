// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_facebool_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_gmail_usecase.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithGmailUseCase _signInWithGmailUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;

  AuthCubit(this._signInWithGmailUseCase, this._signInWithFacebookUseCase)
      : super(AuthState.initial());

  Future<void> signInWithGmail(BuildContext context) async {
    emit(state.copyWith(isGmailLoading: true));

    final user = await _signInWithGmailUseCase();

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in with Google success!')),
      );
      await Navigator.pushReplacementNamed(
          context, AppRoutesName.dashboardRoute);
      emit(state.copyWith(isGmailLoading: false, user: user));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Sign in with Google failed. Please try again later.')),
      );

      emit(state.copyWith(isGmailLoading: false));
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    emit(state.copyWith(isFacebookLoading: true));

    try {
      await _signInWithFacebookUseCase();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in with Facebook success!')),
      );
      await Navigator.pushReplacementNamed(
          context, AppRoutesName.dashboardRoute);
      emit(state.copyWith(isFacebookLoading: false));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Sign in with Facebook failed. Please try again later.')),
      );
      emit(state.copyWith(isFacebookLoading: false));
    }
  }
}
