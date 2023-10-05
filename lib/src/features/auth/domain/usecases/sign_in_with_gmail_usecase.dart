import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGmailUseCase {
  final AuthRepository _authenticationRepository;

  SignInWithGmailUseCase(this._authenticationRepository);

  Future<User?> call() async {
    return await _authenticationRepository.signInWithGmail();
  }
}
