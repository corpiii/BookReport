import 'package:book_report/data/model/login_info.dart';
import 'package:book_report/data/repository/book_management_repository_impl.dart';
import 'package:book_report/data/repository/oauth_login_repository_impl.dart';
import 'package:book_report/data/repository/random_advice_repostiroy_impl.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/repository/oauth_login_repository.dart';
import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final randomAdviceRepositoryProvider = Provider<RandomAdviceRepository>((ref) {
  return RandomAdviceRepositoryImpl();
});

final oAuthLoginRepositoryProvider = Provider<OAuthLoginRepository>((ref) {
  final getIt = GetIt.instance;

  return OAuthLoginRepositoryImpl(
    loginInfo: getIt.get<LoginInfo>(),
    firebaseAuth: getIt.get<FirebaseAuth>(),
  );
});

final bookManagementRepositoryProvider = Provider<BookManagementRepository>((ref) {
  return BookManagementRepositoryImpl(
    firebaseAuth: GetIt.instance.get<FirebaseAuth>(),
  );
});
