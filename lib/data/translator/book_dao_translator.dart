import 'package:book_report/common/translator/interface/translator.dart';
import 'package:book_report/data/dao/book_dao.dart';
import 'package:book_report/domain/dto/book_dto.dart';

class BookDAOTranslator implements Translator<BookDAO, BookDTO> {
  @override
  BookDAO translateFrom(BookDTO data) {
    return BookDAO(
      id: data.id,
      author: data.author,
      title: data.title,
    );
  }

  @override
  BookDTO translateTo(BookDAO data) {
    return BookDTO(
      id: data.id,
      author: data.author,
      title: data.title,
    );
  }
}
