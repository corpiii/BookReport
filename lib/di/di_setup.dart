import 'package:book_report/data/model/login_info.dart';
import 'package:book_report/data/repository/oauth_login_repository_impl.dart';
import 'package:get_it/get_it.dart';

void diSetup() {
  final getIt = GetIt.instance;

  getIt.registerSingleton(LoginInfo());
}