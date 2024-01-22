import 'package:book_report/domain/model/book_history.dart';
import 'package:book_report/domain/usecase/fetch_book_history_use_case/interface/fetch_book_history_use_case.dart';

class FetchBookHistoryUseCaseImpl implements FetchBookHistoryUseCase {
  @override
  Future<List<BookHistory>> execute() async {
     return [];
  }
}