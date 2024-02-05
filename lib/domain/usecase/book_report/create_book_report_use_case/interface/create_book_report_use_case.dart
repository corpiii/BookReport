import 'package:book_report/domain/model/result.dart';

abstract interface class CreateBookReportUseCase {
  Future<Result<void>> execute({
    required String bookId,
    required String title,
    required String content,
  });
}
