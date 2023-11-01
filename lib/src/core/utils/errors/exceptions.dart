import 'package:equatable/equatable.dart';

class FirebaseException extends Equatable implements Exception {
  final String? message;

  const FirebaseException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
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

class OperationCancelledException extends FirebaseException {
  const OperationCancelledException([message])
      : super(
            "The operation was canceled, typically due to a concurrent change.");
}

class DataLossException extends FirebaseException {
  const DataLossException([message])
      : super("Some data was lost during the operation.");
}

class DeadlineExceededException extends FirebaseException {
  const DeadlineExceededException([message])
      : super("The deadline for the operation was exceeded.");
}

class InternalException extends FirebaseException {
  const InternalException([message])
      : super("An internal error occurred in the Firestore service.");
}

class InvalidArgumentException extends FirebaseException {
  const InvalidArgumentException([message])
      : super(
            "An invalid argument was provided, such as a query that cannot be executed.");
}

class NotFoundException extends FirebaseException {
  const NotFoundException([message])
      : super("The requested document or resource was not found.");
}

class OutOfRangeException extends FirebaseException {
  const OutOfRangeException([message])
      : super("An array or map index is out of range.");
}

class PermissionDeniedException extends FirebaseException {
  const PermissionDeniedException([message])
      : super("The client does not have permission to perform the operation.");
}

class ResourceExhaustedException extends FirebaseException {
  const ResourceExhaustedException([message])
      : super(
            "Resources for the operation are exhausted, such as the maximum number of queries.");
}

class UnauthenticatedException extends FirebaseException {
  const UnauthenticatedException([message])
      : super(
            "The request does not have valid authentication credentials for the operation.");
}

class UnavailableException extends FirebaseException {
  const UnavailableException([message])
      : super(
            "The service is currently unavailable. This can occur due to maintenance or other reasons.");
}

class UnimplementedException extends FirebaseException {
  const UnimplementedException([message])
      : super("The requested operation is not implemented or supported.");
}

class FacebookSignInException implements Exception {
  final String message;

  FacebookSignInException(this.message);
}

class SignInWithGmailException implements Exception {
  final String message;

  SignInWithGmailException(this.message);
}

class SignOutException implements Exception {
  final String message;

  SignOutException(this.message);
}
