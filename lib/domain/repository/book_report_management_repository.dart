import 'package:book_report/domain/dto/book_report_dto.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class BookReportManagementRepository {
  Future<Result<List<BookReportDTO>>> fetchAllBookReportBy(String bookId);
  Future<Result<void>> createBookReport({required String bookId, required String title, required String content});
  Future<Result<void>> editBookReport({required String bookId, required BookReportDTO report});
  Future<Result<void>> deleteBookReport({required String bookId, required BookReportDTO report});
}