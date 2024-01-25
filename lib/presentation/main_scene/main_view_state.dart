import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:book_report/data/model/login_user.dart';

part 'main_view_state.freezed.dart';

@freezed
class MainViewState with _$MainViewState {
  const factory MainViewState({
    @Default(0) int selectedIndex,
  }) = _MainViewState;
}