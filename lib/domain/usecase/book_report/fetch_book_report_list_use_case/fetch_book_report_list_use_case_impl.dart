import 'package:book_report/domain/dto/book_report_dto.dart';
import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_report_management_repository.dart';
import 'package:book_report/domain/translator/book_report_translator.dart';
import 'package:book_report/domain/usecase/book_report/fetch_book_report_list_use_case/interface/fetch_book_report_list_use_case.dart';

class FetchBookReportListUseCaseImpl implements FetchBookReportListUseCase {
  final BookReportManagementRepository _bookReportManagementRepository;

  const FetchBookReportListUseCaseImpl({
    required BookReportManagementRepository bookReportManagementRepository,
  }) : _bookReportManagementRepository = bookReportManagementRepository;

  @override
  Future<Result<List<BookReport>>> execute({required String bookId}) async {
    final result = await _bookReportManagementRepository.fetchAllBookReportBy(bookId);

    switch (result) {
      case Success<List<BookReportDTO>>():
        final translator = BookReportTranslator();
        final reportList = result.data.map((e) => translator.translateTo(e)).toList();

        return Result.success(reportList);
      case Error<List<BookReportDTO>>():
        return Result.error(result.e);
    }
  }
}