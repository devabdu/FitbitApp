import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/core/utils/maps/maps.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CreateUserInfoUseCase _createUserInfoUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  RegisterCubit(
      this._createUserInfoUseCase, this._signUpWithEmailAndPasswordUseCase)
      : super(RegisterInitial());

  Future<void> createUserInfo({
    required String uid,
    required String gender,
    required double weight,
    required double height,
  }) async {
    final userInfoParameters = UserInfoParameters(
      uid: uid,
      gender: gender,
      weight: weight,
      height: height,
    );
    final response = await _createUserInfoUseCase(userInfoParameters);

    emit(response.fold(
      (failure) => CreateUserInfoError(error: Maps.mapFailureToMsg(failure)),
      (r) => CreateUserInfoSuccess(),
    ));
  }

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final signUpParameters = SignUpParameters(
      name: name,
      email: email,
      password: password,
    );
    final response = await _signUpWithEmailAndPasswordUseCase(signUpParameters);

    emit(response.fold(
      (failure) => SignUpError(error: Maps.mapFailureToMsg(failure)),
      (user) => SignUpSuccess(user: user),
    ));
  }
}
