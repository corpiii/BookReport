import 'package:book_report/presentation/book_report_detail_scene/book_report_detail_view.dart';
import 'package:book_report/presentation/book_report_list_scene/book_report_list_view.dart';
import 'package:book_report/presentation/login_scene/login_view.dart';
import 'package:book_report/presentation/main_scene/main_scene.dart';
import 'package:go_router/go_router.dart';

const loginPath = '/';
const mainPath = '/main';
const bookReportListPath = '$mainPath/bookReportList';
const reportDetailPath = '$bookReportListPath/reportDetail';

final GoRouter routes = GoRouter(
    initialLocation: '/main/bookReportList',
    routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
      path: '/main',
      builder: (context, state) {
        return MainView();
      },
      routes: [
        GoRoute(
            path: 'bookReportList',
            builder: (context, state) {
              // state.extra BookModel
              return BookReportListView();
            },
            routes: [
              GoRoute(
                path: 'reportDetail',
                builder: (context, state) {
                  // state.extra ReportModel

                  return BookReportDetailView();
                },
              )
            ]),
      ]),
]);
