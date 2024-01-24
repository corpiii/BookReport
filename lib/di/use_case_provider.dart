import 'package:book_report/di/repository_provider.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/delete_account_use_case_impl.dart';
import 'package:book_report/domain/usecase/delete_account_use_case/interface/delete_account_use_case.dart';
import 'package:book_report/domain/usecase/logout_use_case/interface/logout_use_case.dart';
import 'package:book_report/domain/usecase/logout_use_case/logout_use_case_impl.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/interface/oauth_login_use_case.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/oauth_login_use_case_impl.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/random_advice_use_case_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomAdviceUseCaseProvider = Provider<RandomAdviceUseCase>((ref) {
  return RandomAdviceUseCaseImpl(randomAdviceRepository: ref.watch(randomAdviceRepositoryProvider));
});

final oAuthLoginUseCaseProvider = Provider<OAuthLoginUseCase>((ref) {
  return OAuthLoginUseCaseImpl(oAuthRepository: ref.watch(oAuthLoginRepositoryProvider));
});

final oAuthLogoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCaseImpl(oAuthRepository: ref.watch(oAuthLoginRepositoryProvider));
});

final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) {
  return DeleteAccountUseCaseImpl(oAuthLoginRepository: ref.watch(oAuthLoginRepositoryProvider));
});
