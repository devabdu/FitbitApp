import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/usecases/base_usecase.dart';
import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase
    extends BaseUseCase<void, SignInParameters> {
  final AuthRepository authRepository;

  SignInWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(SignInParameters parameters) async {
    return await authRepository.signInWithEmailAndPassword(parameters);
  }
}

class SignInParameters extends Equatable {
  final String email;
  final String password;

  const SignInParameters({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
