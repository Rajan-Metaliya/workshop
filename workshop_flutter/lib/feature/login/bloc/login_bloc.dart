import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/repo.dart';
import '../../../utils/exceptions/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoadedState()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        await userRepo.login(event.username, event.password);
        emit(LoginSuccessState());
      } on RepoException catch (e) {
        emit(LoginErrorState(e.message));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
