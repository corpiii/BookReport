import 'package:book_report/domain/model/book_history.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class FetchBookHistoryUseCase {
  Future<Result<List<BookHistory>>> execute();
}