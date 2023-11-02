part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class SignInLoading extends LoginState {}

class SignInSuccess extends LoginState {}

class SignInError extends LoginState {
  final String error;

  const SignInError({required this.error});

  @override
  List<Object> get props => [error];
}

class SignOutLoading extends LoginState {}

class SignOutSuccess extends LoginState {}

class SignOutError extends LoginState {
  final String error;

  const SignOutError({required this.error});

  @override
  List<Object> get props => [error];
}

class ResetPasswordLoading extends LoginState {}

class ResetPasswordSuccess extends LoginState {}

class ResetPasswordError extends LoginState {
  final String error;

  const ResetPasswordError({required this.error});

  @override
  List<Object> get props => [error];
}
