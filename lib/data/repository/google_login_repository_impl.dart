import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_repository/google_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginRepositoryImpl implements GoogleLoginRepository {
  @override
  Future<Result<UserDTO>> login() async {
    final firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return Result.error(OAuthError.loginError.message);
    }

    final authentication = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    firebaseAuth.signInWithCredential(credential);

    if (firebaseAuth.currentUser == null) {
      return Result.error(OAuthError.loginError.message);
    }

    return Result.success(UserDTO(
      id: googleSignInAccount.id,
      uid: firebaseAuth.currentUser!.uid,
      email: googleSignInAccount.email,
      displayName: googleSignInAccount.displayName,
      photoUrl: googleSignInAccount.photoUrl,
    ));
  }
}
