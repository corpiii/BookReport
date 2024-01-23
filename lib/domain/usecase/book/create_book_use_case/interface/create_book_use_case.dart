import 'package:book_report/domain/model/book.dart';

abstract interface class CreateBookUseCase {
  Future<Book?> execute({required String title});
}