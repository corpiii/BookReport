import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class OAuthLoginUseCase {
  Future<Result<void>> execute(OAuthMethod method);
}