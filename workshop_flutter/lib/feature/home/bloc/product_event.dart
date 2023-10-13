part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class ProductFetchEvent extends ProductEvent {}

final class ProductAddToCartEvent extends ProductEvent {
  final Product product;

  ProductAddToCartEvent(this.product);
}

// add product_event

final class ProductAddProductEvent extends ProductEvent {
  ProductAddProductEvent();
}
