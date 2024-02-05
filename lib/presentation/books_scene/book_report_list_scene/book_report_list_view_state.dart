import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/model/book_report.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_report_list_view_state.freezed.dart';

@freezed
class BookReportListViewState with _$BookReportListViewState {
  const factory BookReportListViewState({
    @Default([]) List<BookReport> bookReportList,
  }) = _BookReportListViewState;
}