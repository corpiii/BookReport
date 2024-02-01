import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class FetchBookReportListUseCase {
  Future<Result<List<BookReport>>> execute({required String bookId});
}