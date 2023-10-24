import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUseCase extends BaseUseCase<void, NoParameters> {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(NoParameters parameters) async {
    return await authRepository.signInWithGoogle();
  }
}
