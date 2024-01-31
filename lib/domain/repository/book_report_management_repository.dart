import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class BookReportManagementRepository {
  Future<Result<List<BookReport>>> fetchAllBookReportBy(String bookId);
  Future<Result<void>> createBookReport({required String title, required String content});
  Future<Result<void>> editBookReport({required String bookId, required BookReport report});
  Future<Result<void>> deleteBookReport({required String bookId, required BookReport report});
}