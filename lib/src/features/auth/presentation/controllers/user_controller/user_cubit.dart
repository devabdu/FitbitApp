import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitbit/src/features/auth/domain/entities/user_entity.dart';
import 'package:fitbit/src/features/auth/domain/usecases/get_user_info_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserInfoUseCase _getUserInfoUseCase;

  UserCubit(this._getUserInfoUseCase) : super(UserInitial());

  Future<void> getUserInfo({required String uid}) async {
    final GetUserInfoParameters getUserInfoParameters =
        GetUserInfoParameters(uid: uid);
    final response = await _getUserInfoUseCase(getUserInfoParameters);

    response.fold(
      (l) => emit(GetUserInfoError(error: l.message)),
      (r) => emit(GetUserInfoSuccess(user: r)),
    );
  }
}
