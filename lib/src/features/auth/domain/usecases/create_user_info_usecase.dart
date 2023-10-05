import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class CreateUserInfoUseCase extends BaseUseCase<void, UserInfoParameters> {
  final AuthRepository authRepository;

  CreateUserInfoUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(UserInfoParameters parameters) async {
    return await authRepository.createUserInfo(parameters);
  }
}

class UserInfoParameters extends Equatable {
  final String gender;
  final double weight;
  final double height;

  const UserInfoParameters(
      {required this.gender, required this.weight, required this.height});

  @override
  List<Object?> get props => [gender, weight, height];
}
