import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop_client/workshop_client.dart';

import '../../../data/repo/repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartFetchEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        final carts = await cartRepo.getCartList();
        emit(CartLoadedState(carts));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });

    on<CartRemoveItemEvent>(
      (event, emit) async {
        final currentState = state as CartLoadedState;

        emit(CartLoadingState());
        try {
          await cartRepo.deleteCart(event.cart);
          emit(CartShowMessageState("Product added to cart"));
        } catch (e) {
          emit(CartShowMessageState(e.toString()));
        }
        emit(currentState);
        add(CartFetchEvent());
      },
    );
  }
}
