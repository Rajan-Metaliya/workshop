import 'package:go_router/go_router.dart';
import 'package:workshop_flutter/app/routes/route_path.dart';
import 'package:workshop_flutter/feature/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
