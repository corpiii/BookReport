import 'package:book_report/domain/model/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_view_state.freezed.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default('') String randomAdvice,
    required String notificationComment,
    required bool sundayTap,
    required bool mondayTap,
    required bool tuesdayTap,
    required bool wednesdayTap,
    required bool thursdayTap,
    required bool fridayTap,
    required bool saturdayTap,
    required int alertHour,
    required int alertMinutes,
    @Default([null, null, null, null, null]) List<Book?> lastBooks,
  }) = _HomeViewState;
}