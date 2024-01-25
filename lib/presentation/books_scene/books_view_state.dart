import 'package:book_report/domain/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'books_view_state.freezed.dart';

@freezed
class BooksViewState with _$BooksViewState {
  const factory BooksViewState({
    @Default([]) List<Book> bookList,
  }) = _BooksViewState;
}