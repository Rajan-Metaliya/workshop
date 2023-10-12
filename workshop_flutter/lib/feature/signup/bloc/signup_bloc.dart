import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop_client/workshop_client.dart';

import '../../../data/repo/repo.dart';
import '../../../utils/exceptions/exceptions.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupLoadedState()) {
    on<SignupButtonPressedEvent>((event, emit) async {
      emit(SignupLoadingState());

      try {
        await userRepo.register(
          Users(
              name: event.username,
              email: event.email,
              password: event.password,
              token: ""),
        );
        emit(SignupSuccessState());
      } on RepoException catch (e) {
        emit(SignupErrorState(e.message));
      } catch (e) {
        emit(SignupErrorState(e.toString()));
      }
    });
  }
}
