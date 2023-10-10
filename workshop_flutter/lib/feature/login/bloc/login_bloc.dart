import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoadedState()) {
    on<LoginButtonPressedEvent>((event, emit) {
      emit(LoginLoadingState());

      try {
        userRepo.login(event.username, event.password);
        emit(LoginSuccessState());
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
