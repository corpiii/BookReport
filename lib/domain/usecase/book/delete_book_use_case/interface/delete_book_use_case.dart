import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class DeleteBookUseCase {
  Future<Result<Book>> execute(Book model);
}