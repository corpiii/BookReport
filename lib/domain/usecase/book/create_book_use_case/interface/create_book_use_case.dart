import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class CreateBookUseCase {
  Future<Result<void>> execute({required String title});
}