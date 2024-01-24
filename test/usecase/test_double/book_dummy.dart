import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/book.dart';

abstract class BookDTOListDummy {
  static List<BookDTO> dummy = [
    BookDTO(id: '1', author: '1', title: 'testTitle1'),
    BookDTO(id: '2', author: '2', title: 'testTitle1'),
    BookDTO(id: '3', author: '3', title: 'testTitle1'),
    BookDTO(id: '4', author: '4', title: 'testTitle1'),
    BookDTO(id: '5', author: '5', title: 'testTitle1'),
  ];
}

abstract class BookListDummy {
  static List<Book> dummy = [
    Book(id: '1', author: '1', title: 'testTitle1'),
    Book(id: '2', author: '2', title: 'testTitle1'),
    Book(id: '3', author: '3', title: 'testTitle1'),
    Book(id: '4', author: '4', title: 'testTitle1'),
    Book(id: '5', author: '5', title: 'testTitle1'),
  ];
}