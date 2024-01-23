import 'package:book_report/domain/model/book_history.dart';
import 'package:book_report/domain/repository/book_management_repository.dart';
import 'package:book_report/domain/translator/history_translator.dart';
import 'package:book_report/domain/usecase/fetch_book_history_use_case/interface/fetch_book_history_use_case.dart';

class FetchBookHistoryUseCaseImpl implements FetchBookHistoryUseCase {
  final BookManagementRepository _bookManagementRepository;

  const FetchBookHistoryUseCaseImpl({
    required BookManagementRepository bookManagementRepository,
  }) : _bookManagementRepository = bookManagementRepository;

  @override
  Future<List<BookHistory>> execute() async {
    final translator = HistoryTranslator();
    final histories = await _bookManagementRepository.fetchReportHistory();

    return histories.map((e) => translator.translateTo(e)).toList();
  }
}