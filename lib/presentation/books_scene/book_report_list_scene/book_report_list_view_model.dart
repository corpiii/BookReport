import 'package:book_report/domain/model/book.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReportListViewModel extends StateNotifier<BookReportListViewState> {
  final Book _bookModel;

  String get navigationTitle => _bookModel.title;

  BookReportListViewModel({
    required Book bookModel,
  })  : _bookModel = bookModel,
        super(BookReportListViewState());


}
