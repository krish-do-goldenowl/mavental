import 'package:mavental/src/network/model/social_user/social_user.dart';
import 'package:mavental/src/network/model/user/user.dart';

import 'package:mavental/src/network/model/common/result.dart';

abstract class SignRepository {
  // Login via SDK
  Future<MResult<MUser>> connectBEWithApple(MSocialUser appleUser);
  Future<MResult<MUser>> connectBEWithFacebook(MSocialUser facebookUser);
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser googleUser);

  // Connect after login with SDK Success
  Future<MResult<MSocialUser>> loginWithApple();
  Future<MResult<MSocialUser>> loginWithFacebook();
  Future<MResult<MSocialUser>?> loginWithGoogle();

  // Login with Email
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password});

  // Sign up with email
  Future<MResult<MUser>> signUpWithEmail(
      {required String email, required String password, required String name});

  Future<MResult<String>> forgotPassword(String email);

  /// Logout
  Future<MResult> logOut(MUser user);

  /// removeAccount
  Future<MResult> removeAccount(MUser user);
}
