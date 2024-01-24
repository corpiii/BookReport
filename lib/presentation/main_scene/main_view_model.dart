import 'package:book_report/domain/usecase/logout_use_case/interface/logout_use_case.dart';
import 'package:book_report/presentation/main_scene/common/pages.dart';
import 'package:book_report/presentation/main_scene/main_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends StateNotifier<MainViewState> {
  final LogoutUseCase _logoutUseCase;

  MainViewModel({
    required LogoutUseCase logoutUseCase,
  })  : _logoutUseCase = logoutUseCase,
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
}
