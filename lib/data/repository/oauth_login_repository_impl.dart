import 'package:book_report/data/model/login_service/google_login_service.dart';
import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class OAuthLoginRepositoryImpl implements OAuthLoginRepository {
  late FirebaseAuth _firebaseAuth;

  OAuthLoginRepositoryImpl() {
    _firebaseInit();
  }

  Future<void> _firebaseInit() async {
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _firebaseAuth = FirebaseAuth.instanceFor(app: app);
  }

  @override
  Future<Result<UserDTO>> login(OAuthMethod method) async {
    final credential;

    switch (method) {
      case OAuthMethod.apple:
        // TODO: Handle this case.
      case OAuthMethod.google:
        credential = await GoogleLoginService().login();
      case OAuthMethod.kakao:
        // TODO: Handle this case.
      default:
        return Result.error(OAuthError.notSupported.message);
    }
    
    _firebaseAuth.signInWithCredential(credential);

    if (_firebaseAuth.currentUser == null) {
      return Result.error(OAuthError.login.message);
    }

    final currentUser = _firebaseAuth.currentUser!;

    return Result.success(UserDTO(
      uid: currentUser.uid,
      displayName: currentUser.displayName,
      photoUrl: currentUser.photoURL,
    ));
  }
}
