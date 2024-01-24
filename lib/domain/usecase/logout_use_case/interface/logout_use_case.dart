import 'package:book_report/domain/model/result.dart';

abstract interface class LogoutUseCase {
  Future<Result<bool>> execute();
}