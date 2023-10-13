part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

// fetch event

class CartFetchEvent extends CartEvent {
  final bool isRefresh;

  CartFetchEvent({this.isRefresh = false});
}

class CartRemoveItemEvent extends CartEvent {
  final Cart cart;
  final int quantity;

  CartRemoveItemEvent(this.cart, this.quantity);
}
