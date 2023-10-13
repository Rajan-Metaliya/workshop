part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<Cart> carts;
  final double totalPrice;

  CartLoadedState(this.carts, this.totalPrice);
}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);
}

class CartShowMessageState extends CartState {
  final String message;

  CartShowMessageState(this.message);
}
