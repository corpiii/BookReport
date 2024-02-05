import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:book_report/domain/usecase/book_report/create_book_report_use_case/interface/create_book_report_use_case.dart';

class CreateBookReportUseCaseImpl implements CreateBookReportUseCase {
  final BookReportManagementRepository _bookReportManagementRepository;

  const CreateBookReportUseCaseImpl({
    required BookReportManagementRepository bookReportManagementRepository,
  }) : _bookReportManagementRepository = bookReportManagementRepository;

  @override
  Future<Result<void>> execute({
    required String bookId,
    required String title,
    required String content,
  }) async {
    final result = await _bookReportManagementRepository.createBookReport(
      bookId: bookId,
      title: title,
      content: content,
    );

    switch (result) {
      case Success<void>():
        final data = result.data;

        return Result.success(data);
      case Error<void>():
        return Result.error(result.e);
    }
  }
}
