part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class GetUserInfoLoading extends UserState {}

class GetUserInfoSuccess extends UserState {
  final UserEntity user;

  const GetUserInfoSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class GetUserInfoError extends UserState {
  final String error;

  const GetUserInfoError({required this.error});

  @override
  List<Object> get props => [error];
}
