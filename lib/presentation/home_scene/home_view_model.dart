import 'package:book_report/domain/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  RandomAdviceUseCase _randomAdviceUseCase;

  HomeViewModel({
    required randomAdviceUseCase,
  })  : _randomAdviceUseCase = randomAdviceUseCase,
        super(HomeViewState());

  Future<void> fetchRandomAdvice() async {
    final advice = await _randomAdviceUseCase.execute();

    state = state.copyWith(randomAdvice: advice);
  }
}
