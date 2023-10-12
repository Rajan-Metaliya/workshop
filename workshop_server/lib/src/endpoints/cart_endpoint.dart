import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;

import '../generated/protocol.dart';

class CartEndpoint extends Endpoint {
  // add to cart
  Future<AppResponse> addToCart(Session session, Cart cart) async {
    try {
      await Cart.insert(session, cart);
      return AppResponse.success("Product added to cart");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  // get cart
  Future<AppResponse<List<Cart>>> getCart(Session session, int userId) async {
    try {
      final cart = await Cart.find(
        session,
        where: (t) => t.userId.equals(userId),
      );

      return AppResponse<List<Cart>>(
        statusCode: 200,
        data: cart,
        message: "${cart.length} products found",
      );
    } catch (e) {
      return AppResponse.error(e.toString());
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
