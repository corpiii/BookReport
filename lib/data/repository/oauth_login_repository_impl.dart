import 'package:book_report/data/model/login_info.dart';
import 'package:book_report/data/model/login_service/google_login_service.dart';
import 'package:book_report/data/model/login_user.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OAuthLoginRepositoryImpl implements OAuthLoginRepository {
  final FirebaseAuth _firebaseAuth;
  final LoginInfo _loginInfo;

  final GoogleLoginService _googleLoginService = GoogleLoginService();

  OAuthLoginRepositoryImpl({required LoginInfo loginInfo, required FirebaseAuth firebaseAuth})
      : _loginInfo = loginInfo,
        _firebaseAuth = firebaseAuth;

  @override
  Future<Result<bool>> login(OAuthMethod method) async {
    final Result<OAuthCredential> result;

    switch (method) {
      case OAuthMethod.apple:
      // TODO: Handle this case.
      case OAuthMethod.google:
        result = await _googleLoginService.login();
      case OAuthMethod.kakao:
      // TODO: Handle this case.
      case OAuthMethod.anonymous:
        _firebaseAuth.signInAnonymously();
        return Result.success(true);
      default:
        return Result.error(OAuthError.notSupported.message);
    }

    if (result is Error<OAuthCredential>) {
      return Result.error(result.e);
    }

    final credential = (result as Success<OAuthCredential>).data;
    _firebaseAuth.signInWithCredential(credential);

    if (_firebaseAuth.currentUser == null) {
      return Result.error(OAuthError.login.message);
    }

    final currentUser = _firebaseAuth.currentUser!;

    _loginInfo.currentUser = LoginUser(
      uid: currentUser.uid,
      displayName: currentUser.displayName,
      photoUrl: currentUser.photoURL,
    );

    return Result.success(true);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _loginInfo.currentUser = null;
  }

  @override
  Future<Result<void>> deleteAccount() async {
    if (_loginInfo.currentUser == null) return Result.error(OAuthError.notDeletedAccount.message);

    // + 모든 책, 독후감 정보도 삭제
    try {
      await _firebaseAuth.currentUser!.delete();
      _loginInfo.currentUser = null;

      return const Result.success(());
    } catch (error) {
      return Result.error(OAuthError.notDeletedAccount.message);
    }
  }
}
