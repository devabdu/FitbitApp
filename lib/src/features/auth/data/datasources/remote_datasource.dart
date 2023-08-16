import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSoucre {
  Future<User?> signInWithGmail();
  Future<void> signOutWithGmail();
  Future<void> signInWithFacebook();
}

class RemoteDataSourceImpl implements RemoteDataSoucre {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  

  @override
  Future<User?> signInWithGmail() async {
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(authCredential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          throw SignInWithGmailException(
              'The account already exists with a different credential.');
        } else if (e.code == 'invalid-credential') {
          throw SignInWithGmailException(
              'Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        throw SignInWithGmailException(
            'Error occurred using Google Sign-In. Try again.');
      }
    }

    return user;
  }

  @override
  Future<void> signOutWithGmail() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw SignOutException('Error occurred using Google Sign-In. Try again.');
    }
  }

  @override
  Future<void> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final AuthCredential authCredential =
          FacebookAuthProvider.credential(accessToken.token);
      await _firebaseAuth.signInWithCredential(authCredential);
    } else {
      throw FacebookSignInException("Facebook login failed");
    }
  }
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
