import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/model/user.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';
import 'package:book_report/presentation/login_scene/login_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginViewState> {
  OAuthLoginUseCase? oAuthLoginUseCase;

  LoginViewModel() : super(LoginViewState());

  Future<void> login(OAuthMethod method) async {
    if (oAuthLoginUseCase == null) return;

    final result = await oAuthLoginUseCase!.execute(method);

    switch (result) {
      case Success<User>():
        break;
      case Error<User>():
        print(result.e);
    }
  }
}