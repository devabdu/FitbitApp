import 'package:fitbit/src/core/utils/errors/failure.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';

class Maps {
  static String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case FirebaseFailure:
        return AppStrings.firebaseFailure;

      case InternetFailure:
        return AppStrings.internetFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
