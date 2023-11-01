import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class FirebaseFailure extends Failure {}

class InternetFailure extends Failure {}
