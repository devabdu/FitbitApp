import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbit/src/features/auth/domain/entities/user.dart';

class UserModel extends UserInfo {
  const UserModel({
    super.name,
    super.uid,
    super.email,
    super.gender,
    super.weight,
    super.height,
  });

  factory UserModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      uid: data?['uid'],
      email: data?['email'],
      gender: data?['gender'],
      weight: data?['weight'],
      height: data?['height'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (uid != null) "uid": uid,
      if (email != null) "email": email,
      if (gender != null) "gender": gender,
      if (weight != null) "weight": weight,
      if (height != null) "height": height,
    };
  }
}
