part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

// fetch event

class CartFetchEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final Cart cart;

  CartRemoveItemEvent(this.cart);
}