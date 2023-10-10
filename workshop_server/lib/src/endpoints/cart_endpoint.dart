import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show Response;

import '../generated/protocol.dart';

class CartEndpoint extends Endpoint {
  // add to cart
  Future<Response> addToCart(Session session, Cart cart) async {
    try {
      await Cart.insert(session, cart);
      return Response.success("Product added to cart");
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // get cart
  Future<Response<List<Cart>>> getCart(Session session, int userId) async {
    try {
      final cart = await Cart.find(
        session,
        where: (t) => t.userId.equals(userId),
      );

      return Response<List<Cart>>(
        statusCode: 200,
        data: cart,
        message: "${cart.length} products found",
      );
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // update cart
  Future<Response> updateCart(Session session, Cart cart) async {
    try {
      await Cart.update(session, cart);
      return Response.success("Cart updated");
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // delete cart
  Future<Response> deleteCart(Session session, int id) async {
    try {
      await Cart.delete(
        session,
        where: (p0) => p0.id.equals(id),
      );
      return Response.success("Cart deleted");
    } catch (e) {
      return Response.error(e.toString());
    }
  }
}
