import 'package:book_report/domain/dto/user_dto.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class GoogleLoginRepository {
  Future<Result<UserDTO>> login();
}