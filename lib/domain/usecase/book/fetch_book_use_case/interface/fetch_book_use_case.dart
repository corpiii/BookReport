import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class FetchBookUseCase {
  Future<Result<List<Book>>> execute();
}