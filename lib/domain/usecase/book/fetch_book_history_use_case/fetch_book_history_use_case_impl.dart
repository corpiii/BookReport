import 'package:book_report/domain/dto/book_history_dto.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/book_history.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/history_translator.dart';
import 'package:book_report/domain/usecase/book/fetch_book_history_use_case/interface/fetch_book_history_use_case.dart';

class FetchBookHistoryUseCaseImpl implements FetchBookHistoryUseCase {
  final BookManagementRepository _bookManagementRepository;

  const FetchBookHistoryUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<Result<List<BookHistory>>> execute() async {
    final translator = HistoryTranslator();
    final result = await _bookManagementRepository.fetchReportHistory();

    switch (result) {
      case Success<List<BookHistoryDTO>>():
        final data = result.data.map((e) => translator.translateTo(e)).toList();

        return Result.success(data);
      case Error<List<BookHistoryDTO>>():
        return Result.error(AppError.fetch.message);
    }
  }
}