import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/app_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_repository/google_login_repository.dart';
import 'package:book_report/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginRepositoryImpl implements GoogleLoginRepository {
  late FirebaseAuth _firebaseAuth;

  GoogleLoginRepositoryImpl() {
    _firebaseInit();
  }

  Future<void> _firebaseInit() async {
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _firebaseAuth = FirebaseAuth.instanceFor(app: app);
  }
  
  @override
  Future<Result<UserDTO>> login() async {
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

    _firebaseAuth.signInWithCredential(credential);

    if (_firebaseAuth.currentUser == null) {
      return Result.error(OAuthError.loginError.message);
    }

    final currentUser = _firebaseAuth.currentUser!;

    return Result.success(UserDTO(
      uid: currentUser.uid,
      displayName: currentUser.displayName,
      photoUrl: currentUser.photoURL,
    ));
  }
}
