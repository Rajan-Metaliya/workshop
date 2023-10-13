import 'package:workshop_client/workshop_client.dart';

abstract class CartRepo {
  Future<List<Cart>> getCartList(int userId);
  Future<void> addCart(Cart cart);
  Future<void> updateCart(Cart cart);
  Future<void> deleteCart(int cartId);
}
