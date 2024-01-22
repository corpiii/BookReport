import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/random_advice_use_case/random_advice_use_case_impl.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewProvider = StateNotifierProvider<HomeViewModel, HomeViewState>((ref) {
  return HomeViewModel(
    randomAdviceUseCase: RandomAdviceUseCaseImpl(
      randomAdviceRepository: RandomAdviceRepositoryImpl(),
    ),
  );
});
