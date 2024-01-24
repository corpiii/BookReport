import 'package:book_report/data/repository/google_login_repository_impl.dart';
import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/repository/oauth_repository/google_login_repository.dart';
import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomAdviceRepositoryProvider = Provider<RandomAdviceRepository>((ref) {
  return RandomAdviceRepositoryImpl();
});

final googleLoginRepositoryProvider = Provider<GoogleLoginRepository>((ref) {
  return GoogleLoginRepositoryImpl();
});