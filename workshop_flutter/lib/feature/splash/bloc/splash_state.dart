part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

class SplashInitialState extends SplashState {
  SplashInitialState();
}

class SplashLoadedState extends SplashState {
  SplashLoadedState();
}
