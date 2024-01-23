import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/book_history.dart';
import 'package:book_report/domain/translator/interface/translator.dart';

class HistoryTranslator implements Translator<BookHistoryDTO, BookHistory> {
  @override
  BookHistoryDTO translateFrom(BookHistory data) {
    return BookHistoryDTO(dateTime: data.dateTime.toIso8601String());
  }

  @override
  BookHistory translateTo(BookHistoryDTO data) {
    return BookHistory(dateTime: DateTime.parse(data.dateTime));
  }
}