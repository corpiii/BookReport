import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginUseCase implements OAuthLoginUseCase {
  @override
  Future<Result<User>> execute(OAuthMethod method) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return Result.error('failed to login with google');
    }

    final authentication = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential);

    print(FirebaseAuth.instance.currentUser!.uid);
    return Result.success(User(id: googleSignInAccount.id, email: googleSignInAccount.email));
  }
}