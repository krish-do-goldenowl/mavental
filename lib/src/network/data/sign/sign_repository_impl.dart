import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mavental/src/network/data/sign/sign_repository.dart';
import 'package:mavental/src/network/domain_manager.dart';
import 'package:mavental/src/network/model/user/user.dart';
import 'package:mavental/src/network/model/social_user/social_user.dart';

import 'package:mavental/src/network/model/common/result.dart';

class SignRepositoryImpl extends SignRepository {
  @override
  Future<MResult<MUser>> connectBEWithApple(MSocialUser appleUser) {
    // TODO: implement connectBEWithApple
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> connectBEWithFacebook(MSocialUser facebookUser) {
    // TODO: implement connectBEWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser googleUser) async {
    try {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleUser.accessToken, idToken: googleUser.idToken);
      // Once signed in, return the UserCredential
      final uerCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = uerCredential.user;
      final newUser = MUser(
        id: user?.uid ?? '',
        email: googleUser.email,
        name: googleUser.fullName,
        avatar: user?.photoURL ?? '',
      );
      final userResult = await DomainManager().user.getOrAddUser(newUser);

      return MResult.success(userResult.data ?? newUser);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MSocialUser>> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<MResult<MSocialUser>> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<MResult<MSocialUser>?> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        await googleSignIn.signOut();
      }
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        return MResult.success(
            MSocialUser.fromGoogleAccount(googleUser, googleAuth));
      }
      return null;
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        return MResult.error('cannot get user data');
      }

      return MResult.success(
        MUser(id: user.uid, email: email, name: user.displayName ?? ''),
      );
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user == null) {
        return MResult.error('Cannot get user data');
      }

      final newUser = MUser(id: user.uid, email: email, name: name);
      await DomainManager().user.getOrAddUser(newUser);
      return MResult.success(newUser);
    } catch (e) {
      final errorStringList = e.toString().split('] ');
      return MResult.exception(
        e,
        message: errorStringList[errorStringList.length > 1 ? 1 : 0],
      );
    }
  }

  @override
  Future<MResult<String>> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return MResult.success('success');
    } catch (e) {
      return MResult.exception(
        e,
        message:
            'Email sent failed. Please make sure to enter the correct email address.',
      );
    }
  }

  @override
  Future<MResult> logOut(MUser user) async {
    try {
      await FirebaseAuth.instance.signOut();
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult> removeAccount(MUser user) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.delete();
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
