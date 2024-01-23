import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomAdviceRepository = Provider<RandomAdviceRepository>((ref) {
  return RandomAdviceRepositoryImpl();
});