part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<Cart> carts;

  CartLoadedState(this.carts);
}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);
}

class CartShowMessageState extends CartState {
  final String message;

  CartShowMessageState(this.message);
}
