import 'package:book_report/domain/model/user.dart';
import 'package:book_report/presentation/books_scene/book_report_create_scene/book_report_create_view.dart';
import 'package:book_report/presentation/books_scene/book_report_detail_scene/book_report_detail_view.dart';
import 'package:book_report/presentation/books_scene/book_report_edit_scene/book_report_edit_view.dart';
import 'package:book_report/presentation/books_scene/book_report_list_scene/book_report_list_view.dart';
import 'package:book_report/presentation/home_scene/notification_setting_scene/notification_setting_view.dart';
import 'package:book_report/presentation/login_scene/login_view.dart';
import 'package:book_report/presentation/main_scene/main_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const loginPath = '/';
const mainPath = '/main';
const notificationSettingPath = '$mainPath/notificationSetting';

const bookReportListPath = '$mainPath/bookReportList';
const reportDetailPath = '$bookReportListPath/reportDetail';
const reportCreatePath = '$bookReportListPath/reportCreate';
const reportEditPath = '$bookReportListPath/reportEdit';

final GoRouter routes = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) {
        // final user = state.extra as User;

        return MainView();
      },
      routes: [
        GoRoute(
            path: 'notificationSetting',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: NotificationSettingView(),
                transitionsBuilder: (context, animation, secondAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeIn;

                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                });
            }
        ),
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
              ),
              GoRoute(
                  path: 'reportCreate',
                  builder: (context, state) {
                    // state.extra

                    return BookReportCreateView();
                  }),
              GoRoute(
                  path: 'reportEdit',
                  builder: (context, state) {
                    // state.extra

                    return BookReportEditView();
                  })
            ]),
      ],
    ),
  ],
);
