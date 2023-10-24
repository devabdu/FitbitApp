import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? uid;
  final String? email;
  final String? gender;
  final double? weight;
  final double? height;

  const UserEntity({
    this.name,
    this.uid,
    this.email,
    this.gender,
    this.weight,
    this.height,
  });

  @override
  List<Object?> get props => [
        name,
        uid,
        email,
        gender,
        weight,
        height,
      ];
}
