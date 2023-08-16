import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/features/auth/data/datasources/remote_datasource.dart';
import 'package:fitbit/src/features/auth/domain/repositories/authentication_repository.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final RemoteDataSoucre _remoteDataSoucre;

  const FirebaseAuthenticationRepository(this._remoteDataSoucre);

  @override
  Future<User?> signInWithGmail() async {
    return await _remoteDataSoucre.signInWithGmail();
  }

  @override
  Future<void> signOutWithGmail() async {
    return await _remoteDataSoucre.signOutWithGmail();
  }

  @override
  Future<void> signInWithFacebook() async {
    return await _remoteDataSoucre.signInWithFacebook();
  }
}
