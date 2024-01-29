import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class BookManagementRepository {
  Future<Result<List<BookHistoryDTO>>> fetchReportHistory();
  Future<Result<void>> createBook({required String id, required String title});
  Future<Result<List<BookDTO>>> fetchBookList();
  Future<Result<void>> editBook({required BookDTO model});
  Future<Result<void>> deleteBook({required BookDTO model});
}