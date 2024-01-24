import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/model/user.dart';

abstract interface class OAuthLoginUseCase {
  Future<Result<User>> execute(OAuthMethod method);
}