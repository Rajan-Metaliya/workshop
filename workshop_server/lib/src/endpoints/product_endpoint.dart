import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;
import 'package:workshop_server/src/generated/product.dart';

class ProductEndpoint extends Endpoint {
  // getAll Products

  Future<List<Product>> getAllProducts(Session session) async {
    try {
      final products = await Product.find(
        session,
        where: (t) => t.id >= 0,
      );

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
