import 'package:workshop_client/workshop_client.dart';

abstract class CartRepo {
  Future<List<Cart>> getCartList();
  Future<void> addCart(Cart cart);
  Future<void> updateCart(Cart cart);
  Future<void> deleteCart(Cart cart);
}
