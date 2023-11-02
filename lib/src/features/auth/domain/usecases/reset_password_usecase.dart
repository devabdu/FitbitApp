import 'package:dartz/dartz.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase extends BaseUseCase<void, String> {
  final AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String parameters) async {
    return await authRepository.resetPassword(parameters);
  }
}
