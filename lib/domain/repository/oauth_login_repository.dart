import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/oauth_method.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class OAuthLoginRepository {
  Future<Result<UserDTO>> login(OAuthMethod method);
  Future<void> logout();
  Future<Result<void>> deleteAccount();
}