import 'package:book_report/di/use_case_provider/random_advice_use_case_provider.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewProvider = StateNotifierProvider<HomeViewModel, HomeViewState>((ref) {
  return HomeViewModel(randomAdviceUseCase: ref.watch(randomAdviceUseCaseProvider));
});
