import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:book_report/domain/translator/book_report_translator.dart';
import 'package:book_report/domain/usecase/book_report/edit_book_report_use_case/interface/edit_book_report_use_case.dart';

class EditBookReportUseCaseImpl implements EditBookReportUseCase {
  final BookReportManagementRepository _bookReportManagementRepository;

  const EditBookReportUseCaseImpl({
    required BookReportManagementRepository bookReportManagementRepository,
  }) : _bookReportManagementRepository = bookReportManagementRepository;

  @override
  Future<Result<void>> execute({required String bookId, required BookReport bookReport}) async {
    final translator = BookReportTranslator();
    final report = translator.translateFrom(bookReport);
    final result = await _bookReportManagementRepository.editBookReport(bookId: bookId, report: report);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(result.e);
    }
  }

}