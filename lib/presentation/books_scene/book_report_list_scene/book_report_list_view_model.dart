import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/book_report.dart';
import 'package:book_report/domain/model/common_error.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book_report/create_book_report_use_case/interface/create_book_report_use_case.dart';
import 'package:book_report/domain/usecase/book_report/delete_book_report_use_case/interface/delete_book_report_use_case.dart';
import 'package:book_report/domain/usecase/book_report/edit_book_report_use_case/interface/edit_book_report_use_case.dart';
import 'package:book_report/domain/usecase/book_report/fetch_book_report_list_use_case/interface/fetch_book_report_list_use_case.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReportListViewModel extends StateNotifier<BookReportListViewState> {
  final FetchBookReportListUseCase _fetchBookReportListUseCase;
  final CreateBookReportUseCase _createBookReportUseCase;
  final EditBookReportUseCase _editBookReportUseCase;
  final DeleteBookReportUseCase _deleteBookReportUseCase;
  Book? bookModel = null;

  BookReportListViewModel({
    required FetchBookReportListUseCase fetchBookReportListUseCase,
    required CreateBookReportUseCase createBookReportUseCase,
    required EditBookReportUseCase editBookReportUseCase,
    required DeleteBookReportUseCase deleteBookReportUseCase,
  })
      : _fetchBookReportListUseCase = fetchBookReportListUseCase,
        _createBookReportUseCase = createBookReportUseCase,
        _editBookReportUseCase = editBookReportUseCase,
        _deleteBookReportUseCase = deleteBookReportUseCase,
        super(BookReportListViewState());

  Future<void> fetchBookReportList({
    required void Function() onComplete,
    required void Function(String message) onError,
  }) async {
    if (bookModel == null) return onError(AppError.fetch.message);

    final result = await _fetchBookReportListUseCase.execute(bookId: bookModel!.id);

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

  Future<void> createBookReport({
    required String title,
    required String content,
    required void Function() onComplete,
    required void Function(String message) onError,
  }) async {
    if (bookModel == null) return onError(AppError.create.message);

    final result = await _createBookReportUseCase.execute(
      bookId: bookModel!.id,
      title: title,
      content: content,
    );

    switch (result) {
      case Success<void>():
        onComplete();
        return;
      case Error<void>():
        onError(result.e);
        return;
    }
  }

  Future<void> editBookReport({
    required BookReport bookReport,
    required void Function() onComplete,
    required void Function(String message) onError,
  }) async {
    if (bookModel == null) return onError(AppError.edit.message);

    final result = await _editBookReportUseCase.execute(
      bookId: bookModel!.id,
      bookReport: bookReport,
    );

    switch (result) {
      case Success<void>():
        onComplete();
        return;
      case Error<void>():
        onError(result.e);
        return;
    }
  }

  Future<void> deleteBookReport({
    required BookReport bookReport,
    required void Function(String message) onError,
  }) async {
    if (bookModel == null) return onError(AppError.delete.message);

    final result = await _deleteBookReportUseCase.execute(
      bookId: bookModel!.id,
      bookReport: bookReport,
    );

    switch (result) {
      case Success<void>():
        // onComplete();
        final deletedBookReportList = state.bookReportList
            .where((element) => element.id != bookReport.id)
            .toList()
            ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

        state = state.copyWith(bookReportList: deletedBookReportList);
        return;
      case Error<void>():
        onError(result.e);
        return;
    }
  }
}
