import 'package:book_report/data/model/login_service/interface/login_service.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginService implements LoginService {
  @override
  Future<Result<void>> login() async {
    final firebaseAuth = FirebaseAuth.instance;

    try {
      final userInfo = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      final OAuthCredential credential = OAuthProvider('apple.com').credential(
        idToken: userInfo.identityToken,
        accessToken: userInfo.authorizationCode,
      );

      await firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      Result.error(OAuthError.login.message);
    }

    return const Result.success(());
  }
}
