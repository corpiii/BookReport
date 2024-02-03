import 'package:book_report/common/translator/interface/translator.dart';
import 'package:book_report/data/dao/book_report_dao.dart';
import 'package:book_report/domain/dto/book_report_dto.dart';

class BookReportDAOTranslator implements Translator<BookReportDAO, BookReportDTO> {
  @override
  BookReportDAO translateFrom(BookReportDTO data) {
    return BookReportDAO(id: data.id,
      author: data.author,
      title: data.title,
      content: data.content,
      timestamp: data.timestamp);
  }

  @override
  BookReportDTO translateTo(BookReportDAO data) {
    return BookReportDTO(id: data.id,
        author: data.author,
        title: data.title,
        content: data.content,
        timestamp: data.timestamp);
  }
}
