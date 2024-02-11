import 'package:book_report/data/model/login_service/interface/login_service.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginService implements LoginService {
  @override
  Future<Result<void>> login() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (await isKakaoTalkInstalled()) {
      try {
        final kakaoLoginInfo = await UserApi.instance.loginWithKakaoTalk();

        final credential = OAuthProvider('oidc.kakao').credential(
          idToken: kakaoLoginInfo.idToken,
          accessToken: kakaoLoginInfo.accessToken,
        );

        await firebaseAuth.signInWithCredential(credential);
        print('카카오톡으로 로그인 성공');

        return Result.success(());

      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return Result.error(OAuthError.login.message);
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final token = await UserApi.instance.loginWithKakaoAccount();

          await firebaseAuth.signInWithCustomToken(token.accessToken);
          print('카카오계정으로 로그인 성공');

          return Result.success(());

        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return Result.error(OAuthError.login.message);
        }
      }
    } else {
      try {

        final kakaoLoginInfo = await UserApi.instance.loginWithKakaoAccount();
        print(await KakaoSdk.origin);

        final credential = OAuthProvider('oidc.kakao').credential(
          idToken: kakaoLoginInfo.idToken,
          accessToken: kakaoLoginInfo.accessToken,
        );

        await firebaseAuth.signInWithCredential(credential);
        print('카카오계정으로 로그인 성공');

        return Result.success(());

      } catch (error) {
        print('?');
        print('카카오계정으로 로그인 실패 $error');
        return Result.error(OAuthError.login.message);
      }
    }
  }

  Future<void> logout() async {
    await UserApi.instance.unlink();
  }

}