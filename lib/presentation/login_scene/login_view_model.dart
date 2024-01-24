import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';
import 'package:book_report/presentation/login_scene/login_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginViewState> {
  OAuthLoginUseCase _oAuthLoginUseCase;

  LoginViewModel({
    required OAuthLoginUseCase oAuthLoginUseCase,
  })  : _oAuthLoginUseCase = oAuthLoginUseCase,
        super(LoginViewState());

  Future<void> login(OAuthMethod method) async {
    if (_oAuthLoginUseCase == null) return;

    final result = await _oAuthLoginUseCase!.execute(method);

    switch (result) {
      case Success<User>():
        print(result.data.id);
        print(result.data.uid);
        print(result.data.displayName);
        print(result.data.email);
        print(result.data.photoUrl);
        break;
      case Error<User>():
        print(result.e);
    }
  }
}
