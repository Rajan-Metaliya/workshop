import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupLoadedState()) {
    on<SignupButtonPressedEvent>((event, emit) {
      emit(SignupLoadingState());

      try {
        userRepo.login(event.username, event.password);
        emit(SignupSuccessState());
      } catch (e) {
        emit(SignupErrorState(e.toString()));
      }
    });
  }
}
