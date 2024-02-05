import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:book_report/domain/translator/book_report_translator.dart';
import 'package:book_report/domain/usecase/book_report/delete_book_report_use_case/interface/delete_book_report_use_case.dart';

class DeleteBookReportUseCaseImpl implements DeleteBookReportUseCase {
  final BookReportManagementRepository _bookReportManagementRepository;

  const DeleteBookReportUseCaseImpl({
    required BookReportManagementRepository bookReportManagementRepository,
  }) : _bookReportManagementRepository = bookReportManagementRepository;

  @override
  Future<Result<void>> execute({required String bookId, required BookReport bookReport}) async {
    final translator = BookReportTranslator();
    final report = translator.translateFrom(bookReport);
    final result = await _bookReportManagementRepository.deleteBookReport(bookId: bookId, report: report);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(result.e);
    }
  }

}