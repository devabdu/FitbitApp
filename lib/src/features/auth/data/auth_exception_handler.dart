import 'package:fitbit/src/core/utils/errors/exceptions.dart';
import 'package:flutter/foundation.dart';

class AuthExceptionHandler {
  static handleException(error) {
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        throw const InvalidEmailException();
      case "ERROR_WRONG_PASSWORD":
        throw const WrongPasswordException();
      case "ERROR_USER_NOT_FOUND":
        throw const UserNotFoundException();
      case "ERROR_USER_DISABLED":
        throw const UserDisabledException();
      case "ERROR_TOO_MANY_REQUESTS":
        throw const TooManyRequestsException();
      case "ERROR_OPERATION_NOT_ALLOWED":
        throw const OperationNotAllowedException();
      case "ERROR_EMAIL_ALREADY_IN_USE":
        throw const EmailAlreadyExistsException();
      default:
        if (kDebugMode) {
          print(error);
        }
        throw const FirebaseException("An undefined Error happened.");
    }
  }
}
