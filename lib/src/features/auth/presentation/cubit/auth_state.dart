part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isGmailLoading;
  final User? user;

  final bool isFacebookLoading;

  const AuthState({
    required this.isGmailLoading,
    required this.user,

    required this.isFacebookLoading,
  });

  factory AuthState.initial() => const AuthState(
        isGmailLoading: false,
        user: null,
        
        isFacebookLoading: false,
      );

  AuthState copyWith({
    bool? isGmailLoading,
    User? user,

    bool? isFacebookLoading,
  }) {
    return AuthState(
      isGmailLoading: isGmailLoading ?? this.isGmailLoading,
      user: user ?? this.user,

      isFacebookLoading: isFacebookLoading ?? this.isFacebookLoading,
    );
  }

  @override
  List<Object?> get props => [
        isGmailLoading,
        user,
        isFacebookLoading,
      ];
}
