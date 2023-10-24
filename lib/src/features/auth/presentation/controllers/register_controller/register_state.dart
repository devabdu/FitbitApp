part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class CreateUserInfoLoading extends RegisterState {}

class CreateUserInfoSuccess extends RegisterState {}

class CreateUserInfoError extends RegisterState {
  final String error;

  const CreateUserInfoError({required this.error});

  @override
  List<Object> get props => [error];
}

class SignUpLoading extends RegisterState {}

class SignUpSuccess extends RegisterState {
  final UserEntity user;

  const SignUpSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class SignUpError extends RegisterState {
  final String error;

  const SignUpError({required this.error});

  @override
  List<Object> get props => [error];
}
