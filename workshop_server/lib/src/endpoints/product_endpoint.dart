import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;
import 'package:workshop_server/src/generated/protocol.dart';

class ProductEndpoint extends Endpoint {
  // getAll Products

  Future<List<Product>> getAllProducts(Session session, String userId) async {
    try {
      final products = await Product.find(
        session,
        where: (t) => t.id >= 0,
      );

      final cartProducts = await Cart.find(
        session,
        where: (t) => t.userId.equals(userId),
      );

      for (var product in products) {
        product.cartQty = cartProducts
            .firstWhere((element) => element.productId == product.productId,
                orElse: () => Cart(
                    userId: userId,
                    productId: product.productId,
                    quantity: 0,
                    cartId: '',
                    productName: '',
                    totalAmount: 0))
            .quantity;
      }

      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Product> getProduct(Session session, int id) async {
    try {
      final products = await Product.findById(
        session,
        id,
      );

      if (products != null) {
        return products;
      }
      throw Exception("Product not found");
    } catch (e) {
      throw AppResponse.error(e.toString());
    }
  }

  // add Product
  Future<bool> addProduct(Session session, Product product) async {
    try {
      await Product.insert(session, product);
      return true;
    } catch (e) {
      return false;
    }
  }

  // update Product
  Future<bool> updateProduct(Session session, Product product) async {
    try {
      await Product.update(session, product);
      return true;
    } catch (e) {
      return false;
    }
  }

  // delete Product
  Future<bool> deleteProduct(Session session, int id) async {
    try {
      await Product.delete(
        session,
        where: (t) => t.id.equals(id),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
