import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/translator/interface/translator.dart';

class BookTranslator implements Translator<BookDTO, Book> {
  @override
  BookDTO translateFrom(Book data) {
    return BookDTO(title: data.title);
  }

  @override
  Book translateTo(BookDTO data) {
    return Book(title: data.title);
  }
}