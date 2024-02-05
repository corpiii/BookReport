import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_model.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view_state.dart';
import 'package:book_report/presentation/books_scene/books_view_model.dart';
import 'package:book_report/presentation/books_scene/books_view_state.dart';
import 'package:book_report/presentation/home_scene/home_view_model.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:book_report/presentation/login_scene/login_view_model.dart';
import 'package:book_report/presentation/login_scene/login_view_state.dart';
import 'package:book_report/presentation/main_scene/main_view_model.dart';
import 'package:book_report/presentation/main_scene/main_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

final homeViewProvider = StateNotifierProvider<HomeViewModel, HomeViewState>((ref) => _getIt.get());
final loginViewModelProvider = StateNotifierProvider<LoginViewModel, LoginViewState>((ref) => _getIt.get());
final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainViewState>((ref) => _getIt.get());
final booksViewModelProvider = StateNotifierProvider<BooksViewModel, BooksViewState>((ref) => _getIt.get());
final bookReportListViewModelProvider =
    StateNotifierProvider<BookReportListViewModel, BookReportListViewState>((ref) => _getIt.get());
