import 'package:go_router/go_router.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/login/login_screen.dart';
import '../../feature/splash/splash_screen.dart';
import 'route_path.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
