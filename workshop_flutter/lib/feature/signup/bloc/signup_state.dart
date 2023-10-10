part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupLoadedState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String error;

  SignupErrorState(this.error);
}
