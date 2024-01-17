import 'package:book_report/presentation/home_scene/home_view.dart';
import 'package:book_report/presentation/login_scene/login_view.dart';
import 'package:go_router/go_router.dart';

const loginViewLocation = '/login';
const homeViewLocation = '/home';

final GoRouter routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
  ]
);
