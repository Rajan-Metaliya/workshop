part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupButtonPressedEvent extends SignupEvent {
  final String username;
  final String password;
  final String email;

  SignupButtonPressedEvent({
    required this.username,
    required this.password,
    required this.email,
  });
}
