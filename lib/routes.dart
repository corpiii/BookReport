import 'package:book_report/presentation/home_scene/home_view.dart';
import 'package:book_report/presentation/login_scene/login_view.dart';
import 'package:book_report/presentation/main_scene/main_scene.dart';
import 'package:go_router/go_router.dart';

const loginViewLocation = '/';
const mainViewLocation = '/main';

final GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => MainView(),
    ),
  ]
);
