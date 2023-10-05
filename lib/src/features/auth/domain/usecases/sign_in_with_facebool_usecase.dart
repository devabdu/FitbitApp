import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithFacebookUseCase {
  final AuthRepository _authenticationRepository;

  SignInWithFacebookUseCase(this._authenticationRepository);

  Future<void> call() async {
    await _authenticationRepository.signInWithFacebook();
  }
}
