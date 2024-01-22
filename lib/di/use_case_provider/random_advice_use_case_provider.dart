import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/random_advice_use_case_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomAdviceUseCaseProvider = Provider<RandomAdviceUseCase>((ref) {
  return RandomAdviceUseCaseImpl(randomAdviceRepository: RandomAdviceRepositoryImpl());
});