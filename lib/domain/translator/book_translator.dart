import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/translator/interface/translator.dart';

class BookTranslator implements Translator<BookDTO, Book> {
  @override
  BookDTO translateFrom(Book data) {
    return BookDTO(id: data.id, title: data.title);
  }

  @override
  Book translateTo(BookDTO data) {
    return Book(id: data.id, title: data.title);
  }
}