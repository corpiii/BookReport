import 'package:book_report/di/use_case_provider.dart';
import 'package:book_report/presentation/books_scene/books_view_model.dart';
import 'package:book_report/presentation/books_scene/books_view_state.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:book_report/presentation/login_scene/login_view_model.dart';
import 'package:book_report/presentation/login_scene/login_view_state.dart';
import 'package:book_report/presentation/main_scene/main_view_model.dart';
import 'package:book_report/presentation/main_scene/main_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewProvider = StateNotifierProvider<HomeViewModel, HomeViewState>((ref) {
  return HomeViewModel(randomAdviceUseCase: ref.watch(randomAdviceUseCaseProvider));
});

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, LoginViewState>((ref) {
  return LoginViewModel(oAuthLoginUseCase: ref.watch(oAuthLoginUseCaseProvider));
});

final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainViewState>((ref) {
  return MainViewModel(
    logoutUseCase: ref.watch(oAuthLogoutUseCaseProvider),
    deleteAccountUseCase: ref.watch(deleteAccountUseCaseProvider),
  );
});

final booksViewModelProvider = StateNotifierProvider<BooksViewModel, BooksViewState>((ref) {
  return BooksViewModel(
    createBookUseCase: ref.watch(createBookUseCaseProvider),
    fetchBookUseCase: ref.watch(fetchBookUseCaseProvider),
    editBookUseCase: ref.watch(editBookUseCaseProvider),
    deleteBookUseCase: ref.watch(deleteBookUseCaseProvider),
  );
});