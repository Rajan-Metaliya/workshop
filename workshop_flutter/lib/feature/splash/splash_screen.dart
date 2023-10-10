import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/route_path.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(SplashInitialEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            context.go(RoutePath.login);
          }
        },
        child: const Scaffold(
          body: Center(
            child: Text('Splash screen'),
          ),
        ),
      ),
    );
  }
}
