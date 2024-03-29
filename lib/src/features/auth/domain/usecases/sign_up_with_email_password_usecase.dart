import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<void, SignUpParameters> {
  final AuthRepository authRepository;

  SignUpWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParameters parameters) async {
    return await authRepository.signUpWithEmailAndPassword(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParameters({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
