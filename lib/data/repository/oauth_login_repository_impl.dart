import 'package:book_report/data/model/login_service/apple_login_service.dart';
import 'package:book_report/data/model/login_service/google_login_service.dart';
import 'package:book_report/data/model/login_service/kakao_login_service.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OAuthLoginRepositoryImpl implements OAuthLoginRepository {
  final FirebaseAuth _firebaseAuth;

  final GoogleLoginService _googleLoginService = GoogleLoginService();
  final AppleLoginService _appleLoginService = AppleLoginService();
  final KakaoLoginService _kakaoLoginService = KakaoLoginService();

  OAuthLoginRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<Result<bool>> login(OAuthMethod method) async {
    final Result<void> result;

    switch (method) {
      case OAuthMethod.apple:
        result = await _appleLoginService.login();
      case OAuthMethod.google:
        result = await _googleLoginService.login();
      case OAuthMethod.kakao:
        result = await _kakaoLoginService.login();
      case OAuthMethod.anonymous:
        _firebaseAuth.signInAnonymously();
        return const Result.success(true);
      default:
        return Result.error(OAuthError.notSupported.message);
    }

    if (result is Error<void>) {
      return Result.error(result.e);
    }

    return const Result.success(true);
  }

  @override
  Future<void> logout({bool isKakao = false}) async {
    if (isKakao) {
      await _kakaoLoginService.logout();
    }

    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<Result<void>> deleteAccount() async {
    if (_firebaseAuth.currentUser == null) return Result.error(OAuthError.notDeletedAccount.message);

    _allDeleteBook(_firebaseAuth.currentUser!.uid);
    _allDeleteBookReport(_firebaseAuth.currentUser!.uid);

    try {
      await _firebaseAuth.currentUser!.delete();

      return const Result.success(());
    } catch (error) {
      return Result.error(OAuthError.notDeletedAccount.message);
    }
  }

  Future<void> _allDeleteBook(String uid) async {
    final bookCollection = FirebaseFirestore.instance.collection('book');

    final willRemovedBookByID = await bookCollection.where('author', isEqualTo: uid).get();
    Future.wait(willRemovedBookByID.docs.map((e) {
      final bookID = e.id;
      return bookCollection.doc(bookID).delete();
    }));
  }

  Future<void> _allDeleteBookReport(String uid) async {
    final bookReportCollection = FirebaseFirestore.instance.collection('bookReport');

    await bookReportCollection.doc(uid).delete();
  }
}
