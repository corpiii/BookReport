import 'package:book_report/domain/model/result.dart';

abstract interface class DeleteAccountUseCase {
  Future<Result<void>> execute();
}