import 'package:go_router/go_router.dart';

import '../../feature/cart/cart_screen.dart';
import '../../feature/home/home_screen.dart';
import '../../feature/login/login_screen.dart';
import '../../feature/signup/signup_screen.dart';
import '../../feature/splash/splash_screen.dart';
import 'route_path.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/${RoutePath.login}",
      name: RoutePath.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/${RoutePath.signUp}",
      name: RoutePath.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
        path: "/${RoutePath.home}",
        name: RoutePath.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: RoutePath.cart,
            name: RoutePath.cart,
            builder: (context, state) => const CartScreen(),
          ),
        ]),
  ],
);
