import 'package:book_report/domain/dto/book_dto.dart';
import 'package:book_report/domain/model/book.dart';

abstract class BookDTOListDummy {
  static List<BookDTO> dummy = [
    BookDTO(id: '1', author: '1', title: 'testTitle1', timestamp: DateTime(2024, 1, 24).toIso8601String()),
    BookDTO(id: '2', author: '2', title: 'testTitle1', timestamp: DateTime(2024, 1, 25).toIso8601String()),
    BookDTO(id: '3', author: '3', title: 'testTitle1', timestamp: DateTime(2024, 1, 26).toIso8601String()),
    BookDTO(id: '4', author: '4', title: 'testTitle1', timestamp: DateTime(2024, 1, 27).toIso8601String()),
    BookDTO(id: '5', author: '5', title: 'testTitle1', timestamp: DateTime(2024, 1, 28).toIso8601String()),
  ];
}

abstract class BookListDummy {
  static List<Book> dummy = [
    Book(id: '1', author: '1', title: 'testTitle1', timestamp: DateTime(2024, 1, 29)),
    Book(id: '2', author: '2', title: 'testTitle1', timestamp: DateTime(2024, 1, 29)),
    Book(id: '3', author: '3', title: 'testTitle1', timestamp: DateTime(2024, 1, 29)),
    Book(id: '4', author: '4', title: 'testTitle1', timestamp: DateTime(2024, 1, 29)),
    Book(id: '5', author: '5', title: 'testTitle1', timestamp: DateTime(2024, 1, 29)),
  ];
}