import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/repo.dart';
import '../../../data/service/service.dart';
import '../../../utils/exceptions/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoadedState()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        final user = await userRepo.login(event.username, event.password);
        if (user != null) {
          await authService.setUser(user);
        } else {
          throw RepoException(message: "Failed to login");
        }
        emit(LoginSuccessState());
      } on RepoException catch (e) {
        emit(LoginErrorState(e.message));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
