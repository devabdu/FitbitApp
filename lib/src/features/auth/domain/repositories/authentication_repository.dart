import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> signInWithGmail();
  Future<void> signOutWithGmail();
   Future<void> signInWithFacebook();
}
