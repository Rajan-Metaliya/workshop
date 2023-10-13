import 'package:workshop_client/workshop_client.dart';

import '../../../utils/exceptions/exceptions.dart';
import '../../service/service.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  @override
  Future<void> addCart(Cart cart) async {
    try {
      await apiServer.client.cart.addToCart(cart);
    } catch (e) {
      throw RepoException(message: "Failed to add product");
    }
  }

  @override
  Future<void> deleteCart(int cartId) async {
    try {
      await apiServer.client.cart.deleteCart(cartId);
    } catch (e) {
      throw RepoException(message: "Failed to delete product");
    }
  }

  @override
  Future<List<Cart>> getCartList(String userId) async {
    try {
      final carts = await apiServer.client.cart.getCart(userId);

      return carts;
    } catch (e) {
      throw RepoException(message: "Failed to get cart");
    }
  }

  @override
  Future<void> updateCart(Cart cart) async {
    try {
      await apiServer.client.cart.updateCart(cart);
    } catch (e) {
      throw RepoException(message: "Failed to update product");
    }
  }
}
