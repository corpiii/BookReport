import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class EditBookUseCase {
  Future<Result<void>> execute(Book model);
}