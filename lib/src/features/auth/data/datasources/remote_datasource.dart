import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/utils/errors/exceptions.dart';
import 'package:fitbit/src/features/auth/data/auth_exception_handler.dart';
import 'package:fitbit/src/features/auth/data/firestore_exception_handler.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSoucre {
  Future<void> createUserInfo(UserInfoParameters parameters);
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters);
  Future<void> signInWithEmailAndPassword(SignInParameters parameters);
  Future<void> signOut();
  Future<User?> signInWithGmail();
  Future<void> signOutWithGmail();
  Future<void> signInWithFacebook();
}

class RemoteDataSourceImpl implements RemoteDataSoucre {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUserInfo(UserInfoParameters parameters) async {
    try {
      CollectionReference usersRef = _firestore.collection('users');
      await usersRef.add({
        'Gender': parameters.gender,
        'Weight': parameters.weight,
        'Height': parameters.height
      });
    } catch (error) {
      FirestoreExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(SignInParameters parameters) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

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
