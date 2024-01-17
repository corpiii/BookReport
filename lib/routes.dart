import 'package:book_report/presentation/book_detail_scene/book_detail_view.dart';
import 'package:book_report/presentation/login_scene/login_view.dart';
import 'package:book_report/presentation/main_scene/main_scene.dart';
import 'package:go_router/go_router.dart';

const loginViewLocation = '/';
const mainViewLocation = '/main';
const bookDetailViewLocation = '/bookDetail';

final GoRouter routes = GoRouter(
  initialLocation: loginViewLocation,
  routes: [
    GoRoute(
      path: loginViewLocation,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: mainViewLocation,
      builder: (context, state) => MainView(),
    ),
    GoRoute(
      path: bookDetailViewLocation,
      builder: (context, state) {
        // state.extra BookModel
        return BookDetailView();
      },
    ),
  ]
);
