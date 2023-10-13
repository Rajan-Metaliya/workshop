import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:workshop_client/workshop_client.dart';

import '../../../data/repo/repo.dart';
import '../../../data/service/service.dart';
import '../../../utils/exceptions/exceptions.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupLoadedState()) {
    on<SignupButtonPressedEvent>((event, emit) async {
      emit(SignupLoadingState());

      try {
        final user = await userRepo.register(
          Users(
            user_id: Faker().guid.guid(),
            name: event.username,
            email: event.email,
            token: "",
          ),
        );
        if (user != null) {
          await authService.setUser(user);
        } else {
          emit(SignupErrorState("Unable to create user"));
        }
      } on RepoException catch (e) {
        emit(SignupErrorState(e.message));
      } catch (e) {
        emit(SignupErrorState(e.toString()));
      }
    });
  }
}
