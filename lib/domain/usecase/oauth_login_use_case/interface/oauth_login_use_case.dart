import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/oauth_login_use_case/google_login_use_case.dart';

abstract interface class OAuthLoginUseCase {
  Future<Result<User>> execute();
}