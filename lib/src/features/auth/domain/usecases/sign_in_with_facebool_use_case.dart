import 'package:fitbit/src/features/auth/domain/repositories/authentication_repository.dart';

class SignInWithFacebookUseCase {
  final AuthenticationRepository _authenticationRepository;

  SignInWithFacebookUseCase(this._authenticationRepository);

  Future<void> call() async {
    await _authenticationRepository.signInWithFacebook();
  }
}
