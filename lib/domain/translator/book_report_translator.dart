import 'package:book_report/common/translator/interface/translator.dart';
import 'package:book_report/domain/dto/book_report_dto.dart';
import 'package:book_report/domain/model/book_report.dart';

class BookReportTranslator implements Translator<BookReportDTO, BookReport> {
  @override
  BookReportDTO translateFrom(BookReport data) {
    return BookReportDTO(
      id: data.id,
      author: data.author,
      title: data.title,
      content: data.content,
      timestamp: data.dateTime.toIso8601String(),
    );
  }

  @override
  BookReport translateTo(BookReportDTO data) {
    return BookReport(
        id: data.id,
        title: data.title,
        content: data.content,
        dateTime: DateTime.parse(data.timestamp),
        author: data.author);
  }
}
