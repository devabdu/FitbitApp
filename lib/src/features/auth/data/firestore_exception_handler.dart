import 'package:fitbit/src/core/utils/errors/exceptions.dart';
import 'package:flutter/foundation.dart';

class FirestoreExceptionHandler {
  static handleException(error) {
    switch (error.code) {
      case "cancelled":
        throw const OperationCancelledException();
      case "data_loss":
        throw const DataLossException();
      case "deadline-exceeded":
        throw const DeadlineExceededException();
      case "internal":
        throw const InternalException();
      case "invalid-argument":
        throw const InvalidArgumentException();
      case "not-found":
        throw const NotFoundException();
      case "out-of-range":
        throw const OutOfRangeException();
      case "permission-denied":
        throw const PermissionDeniedException();
      case "resource-exhausted":
        throw const ResourceExhaustedException();
      case "unauthenticated":
        throw const UnauthenticatedException();
      case "unavailable":
        throw const UnavailableException();
      case "unimplemented":
        throw const UnimplementedException();
      default:
        if (kDebugMode) {
          print(error);
        }
        throw const FirebaseException(
            "An unknown or unexpected error occurred.");
    }
  }
}
