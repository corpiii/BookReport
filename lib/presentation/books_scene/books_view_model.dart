import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/result.dart';
import 'package:book_report/domain/usecase/book/create_book_use_case/interface/create_book_use_case.dart';
import 'package:book_report/domain/usecase/book/delete_book_use_case/interface/delete_book_use_case.dart';
import 'package:book_report/domain/usecase/book/edit_book_use_case/interface/edit_book_use_case.dart';
import 'package:book_report/domain/usecase/book/fetch_book_use_case/interface/fetch_book_use_case.dart';
import 'package:book_report/presentation/books_scene/books_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksViewModel extends StateNotifier<BooksViewState> {
  final CreateBookUseCase _createBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;
  final EditBookUseCase _editBookUseCase;
  final FetchBookUseCase _fetchBookUseCase;

  BooksViewModel({
    required CreateBookUseCase createBookUseCase,
    required DeleteBookUseCase deleteBookUseCase,
    required EditBookUseCase editBookUseCase,
    required FetchBookUseCase fetchBookUseCase,
  })  : _createBookUseCase = createBookUseCase,
        _deleteBookUseCase = deleteBookUseCase,
        _editBookUseCase = editBookUseCase,
        _fetchBookUseCase = fetchBookUseCase,
        super(const BooksViewState()) {
    fetchBookList();
  }

  Future<Result<void>> createBook({required String title}) async {
    final result = await _createBookUseCase.execute(title: title);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(result.e);
    }
  }

  Future<Result<void>> fetchBookList() async {
    final result = await _fetchBookUseCase.execute();

    switch (result) {
      case Success<List<Book>>():
        final dataList = result.data;

        dataList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        state = state.copyWith(bookList: dataList);

        return const Result.success(());
      case Error<List<Book>>():
        return Result.error(result.e);
    }
  }

  Future<Result<void>> editBook({required Book model, required String updatedTitle}) async {
    final updatedModel = model.copyWith(title: updatedTitle);
    final result = await _editBookUseCase.execute(updatedModel);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(result.e);
    }
  }

  Future<Result<void>> deleteBook({required Book model}) async {
    final result = await _deleteBookUseCase.execute(model);

    switch (result) {
      case Success<void>():
        return Result.success(result.data);
      case Error<void>():
        return Result.error(result.e);
    }
  }

  void deleteAccount() {
    state = state.copyWith(bookList: []);
  }
}