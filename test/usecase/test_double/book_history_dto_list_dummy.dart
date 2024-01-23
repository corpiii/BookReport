import 'package:book_report/domain/dto/book_history_dto.dart';

abstract class BookHistoryDTOListDummy {
  static List<BookHistoryDTO> dummy = [
    BookHistoryDTO(dateTime: DateTime(2024, 1, 19).toIso8601String()),
    BookHistoryDTO(dateTime: DateTime(2024, 1, 20).toIso8601String()),
    BookHistoryDTO(dateTime: DateTime(2024, 1, 21).toIso8601String()),
    BookHistoryDTO(dateTime: DateTime(2024, 1, 22).toIso8601String()),
    BookHistoryDTO(dateTime: DateTime(2024, 1, 23).toIso8601String()),
  ];
}