import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_view_state.freezed.dart';

@freezed
class LoginViewState with _$LoginViewState {
  const factory LoginViewState({
    @Default(false) bool isGoogleSignTap,
    @Default(false) bool isAppleSignTap,
    @Default(false) bool isKakaoSignTap,
  }) = _LoginViewState;
}