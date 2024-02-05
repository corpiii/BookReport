import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';

abstract interface class DeleteBookReportUseCase {
  Future<Result<void>> execute({
    required String bookId,
    required BookReport bookReport
  });
}