import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class BookReportManagementRepository {
  Future<Result<List<BookReport>>> fetchAllBookReportBy(String bookId);
  Future<Result<void>> createBookReport();
  Future<Result<void>> editBookReport(String bookId, BookReport report);
  Future<Result<void>> deleteBookReport(String bookId, BookReport report);
}