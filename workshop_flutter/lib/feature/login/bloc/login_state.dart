part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginLoadedState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}
