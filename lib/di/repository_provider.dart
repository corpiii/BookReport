import 'package:book_report/data/repository/oauth_login_repository_impl.dart';
import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomAdviceRepositoryProvider = Provider<RandomAdviceRepository>((ref) {
  return RandomAdviceRepositoryImpl();
});

final oAuthLoginRepositoryProvider = Provider<OAuthLoginRepository>((ref) {
  return OAuthLoginRepositoryImpl();
});