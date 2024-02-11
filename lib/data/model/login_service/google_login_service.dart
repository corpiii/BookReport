import 'package:book_report/data/model/login_service/interface/login_service.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/model/common_error.dart';

class GoogleLoginService implements LoginService {
  @override
  Future<Result<void>> login() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return Result.error(OAuthError.login.message);
    }

    final authentication = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    return Result.success(credential);
  }
}