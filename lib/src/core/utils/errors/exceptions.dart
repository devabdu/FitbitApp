import 'package:equatable/equatable.dart';

class FirebaseException extends Equatable implements Exception {
  final String? message;

  const FirebaseException([this.message]);

  @override
  List<Object?> get props => [message];
}

class InvalidEmailException extends FirebaseException {
  const InvalidEmailException([message])
      : super("Email address appears to be malformed.");
}

class WrongPasswordException extends FirebaseException {
  const WrongPasswordException([message]) : super("Password is wrong.");
}

class UserNotFoundException extends FirebaseException {
  const UserNotFoundException([message])
      : super("User with this email doesn't exist.");
}

class UserDisabledException extends FirebaseException {
  const UserDisabledException([message])
      : super("User with this email has been disabled.");
}

class TooManyRequestsException extends FirebaseException {
  const TooManyRequestsException([message])
      : super("Too many requests. Try again later.");
}

class OperationNotAllowedException extends FirebaseException {
  const OperationNotAllowedException([message])
      : super("Signing in with Email and Password is not enabled.");
}

class EmailAlreadyExistsException extends FirebaseException {
  const EmailAlreadyExistsException([message])
      : super(
            "The email has already been registered. Please login or reset your password.");
}
