import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/dto/book_history_dto.dart';

abstract interface class BookManagementRepository {
  Future<List<BookHistoryDTO>> fetchReportHistory();
  Future<BookDTO?> createBook({required String title});
}