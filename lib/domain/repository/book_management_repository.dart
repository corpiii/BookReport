import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class BookManagementRepository {
  Future<Result<List<BookHistoryDTO>>> fetchReportHistory();
  Future<Result<BookDTO>> createBook({required String title});
}