import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class GetUserInfoUseCase extends BaseUseCase<void, GetUserInfoParameters> {
  final AuthRepository authRepository;

  GetUserInfoUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(
      GetUserInfoParameters parameters) async {
    return await authRepository.getUserInfo(parameters);
  }
}

class GetUserInfoParameters extends Equatable {
  final String uid;

  const GetUserInfoParameters({required this.uid});

  @override
  List<Object?> get props => [uid];
}
