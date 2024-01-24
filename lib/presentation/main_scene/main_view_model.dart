import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/interface/delete_account_use_case.dart';
import 'package:book_report/domain/usecase/logout_use_case/interface/logout_use_case.dart';
import 'package:book_report/presentation/main_scene/common/pages.dart';
import 'package:book_report/presentation/main_scene/main_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends StateNotifier<MainViewState> {
  final LogoutUseCase _logoutUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  MainViewModel({
    required LogoutUseCase logoutUseCase,
    required DeleteAccountUseCase deleteAccountUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _deleteAccountUseCase = deleteAccountUseCase,
        super(MainViewState());

  void transitionPage(Pages page) {
    switch (page) {
      case Pages.home:
        state = state.copyWith(selectedIndex: 0);
      case Pages.book:
        state = state.copyWith(selectedIndex: 1);
    }
  }

  Future<void> logout() async {
    await _logoutUseCase.execute();
  }

  Future<Result<void>> deleteAccount() async {
    return await _deleteAccountUseCase.execute();
  }
}
