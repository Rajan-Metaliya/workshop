import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;

import '../generated/protocol.dart';

class CartEndpoint extends Endpoint {
  // add to cart
  Future<bool> addToCart(Session session, Cart cart) async {
    try {
      // check if item already exists
      final existingCart = await Cart.findSingleRow(
        session,
        where: (t) =>
            t.userId.equals(cart.userId) & t.productId.equals(cart.productId),
      );

      if (existingCart != null && cart.quantity >= 1) {
        // update quantity
        existingCart.quantity = cart.quantity;
        existingCart.productAmount = cart.productAmount;
        existingCart.totalAmount = cart.quantity * cart.productAmount;
        await Cart.update(session, existingCart);
        return true;
      } else if (existingCart != null && cart.quantity == 0) {
        // delete cart
        await Cart.delete(
          session,
          where: (p0) => p0.id.equals(existingCart.id),
        );
        return true;
      }
      

      await Cart.insert(session, cart);
      return true;
    } catch (e) {
      return false;
    }
  }

  // get cart
  Future<List<Cart>> getCart(Session session, String userId) async {
    try {
      final cart = await Cart.find(
        session,
        where: (t) => t.userId.equals(userId),
      );

      return cart;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // update cart
  Future<AppResponse> updateCart(Session session, Cart cart) async {
    try {
      await Cart.update(session, cart);
      return AppResponse.success("Cart updated");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  // delete cart
  Future<AppResponse> deleteCart(Session session, int id) async {
    try {
      await Cart.delete(
        session,
        where: (p0) => p0.id.equals(id),
      );
      return AppResponse.success("Cart deleted");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }
}
