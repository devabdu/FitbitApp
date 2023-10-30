import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbit/src/core/utils/errors/exceptions.dart';
import 'package:fitbit/src/features/auth/data/auth_exception_handler.dart';
import 'package:fitbit/src/features/auth/data/firestore_exception_handler.dart';
import 'package:fitbit/src/features/auth/data/models/user_model.dart';
import 'package:fitbit/src/features/auth/domain/usecases/create_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:fitbit/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSoucre {
  Future<void> createUserInfo(UserInfoParameters parameters);
  Future<UserModel> getUserInfo(GetUserInfoParameters parameters);
  Future<UserModel> signUpWithEmailAndPassword(SignUpParameters parameters);
  Future<void> signInWithEmailAndPassword(SignInParameters parameters);
  Future<User?> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signOut();
}

class RemoteDataSourceImpl implements RemoteDataSoucre {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUserInfo(UserInfoParameters parameters) async {
    try {
      final userModel = UserModel(
        gender: parameters.gender,
        weight: parameters.weight,
        height: parameters.height,
      );

      DocumentReference usersRef =
          _firestore.collection('users').doc(parameters.uid);

      await usersRef.update(userModel.toFirestore());
    } catch (error) {
      FirestoreExceptionHandler.handleException(error);
    }
  }

  @override
  Future<UserModel> getUserInfo(GetUserInfoParameters parameters) async {
    late UserModel userModel;
    try {
      final usersRef = _firestore.collection('users').doc(parameters.uid);

      final userSnapshot = await usersRef.get();
      userModel = UserModel.fromFireStore(userSnapshot, null);
    } catch (error) {
      FirestoreExceptionHandler.handleException(error);
    }
    return userModel;
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      SignUpParameters parameters) async {
    late UserModel userModel;
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: parameters.email, password: parameters.password);

      String uId = userCredential.user!.uid;
      userModel = UserModel(
        email: parameters.email,
        name: parameters.name,
        uid: uId,
      );

      DocumentReference userRef = _firestore.collection('users').doc(uId);

      await userRef.set(userModel.toFirestore());
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
    return userModel;
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
  Future<User?> signInWithGoogle() async {
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
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
  Future<void> signInWithFacebook() async {
    final response = await FacebookAuth.instance
        .login(permissions: ["email", "public_profile"]);

    if (response.status == LoginStatus.success) {
      final AccessToken accessToken = response.accessToken!;
      final AuthCredential authCredential =
          FacebookAuthProvider.credential(accessToken.token);
      await _firebaseAuth.signInWithCredential(authCredential);
    } else {
      throw FacebookSignInException("Facebook login failed");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final FacebookAuth facebookAuth = FacebookAuth.instance;
      await facebookAuth.logOut();
      await _firebaseAuth.signOut();
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }
}
