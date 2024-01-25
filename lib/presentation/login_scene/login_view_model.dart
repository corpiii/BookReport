import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';
import 'package:book_report/presentation/login_scene/login_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginViewState> {
  OAuthLoginUseCase _oAuthLoginUseCase;

  LoginViewModel({
    required OAuthLoginUseCase oAuthLoginUseCase,
  })  : _oAuthLoginUseCase = oAuthLoginUseCase,
        super(LoginViewState());

  Future<void> login({
    required OAuthMethod method,
    required void Function() onComplete,
    required void Function(String message) onError,
  }) async {
    final result = await _oAuthLoginUseCase.execute(method);

    switch (result) {
      case Success<void>():
        onComplete();
      case Error<void>():
        onError(result.e);
    }
  }
}
