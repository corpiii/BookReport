import 'package:book_report/domain/model/book_history.dart';

abstract interface class FetchBookHistoryUseCase {
  Future<List<BookHistory>> execute();
}