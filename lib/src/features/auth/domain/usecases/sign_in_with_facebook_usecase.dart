import 'package:dartz/dartz.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithFacebookUseCase extends BaseUseCase<void, NoParameters> {
  final AuthRepository authRepository;

  SignInWithFacebookUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await authRepository.signInWithFacebook();
  }
}
