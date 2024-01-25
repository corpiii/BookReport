import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class OAuthLoginRepository {
  Future<Result<void>> login(OAuthMethod method);
  Future<void> logout();
  Future<Result<void>> deleteAccount();
}