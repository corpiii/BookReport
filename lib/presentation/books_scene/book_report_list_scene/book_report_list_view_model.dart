import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book_report/fetch_book_report_list_use_case/interface/fetch_book_report_list_use_case.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReportListViewModel extends StateNotifier<BookReportListViewState> {
  final FetchBookReportListUseCase _fetchBookReportListUseCase;
  Book? _bookModel;

  set bookModel(Book model) {
    _bookModel = model;
    state = state.copyWith(bookModel: model);
 }

  BookReportListViewModel({
    required FetchBookReportListUseCase fetchBookReportListUseCase,
  })  : _fetchBookReportListUseCase = fetchBookReportListUseCase,
        super(BookReportListViewState());

  Future<void> fetchBookReportList({
    required void Function() onComplete,
    required void Function(String message) onError,
  }) async {
    if (state.bookModel == null) return onError(AppError.fetch.message);

    final result = await _fetchBookReportListUseCase.execute(bookId: state.bookModel!.id);

    switch (result) {
      case Success<List<BookReport>>():
        final data = result.data;

        state = state.copyWith(bookReportList: data);
        onComplete();

        return;
      case Error<List<BookReport>>():
        onError(result.e);
        return;
    }
  }
}
