import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show AppResponse;
import 'package:workshop_server/src/generated/product.dart';

class ProductEndpoint extends Endpoint {
  // getAll Products

  Future<AppResponse<List<Product>>> getAllProducts(Session session) async {
    try {
      final products = await Product.find(
        session,
        where: (t) => t.id >= 0,
      );

      return AppResponse<List<Product>>(
        statusCode: 200,
        data: products,
        message: "${products.length} products found",
      );
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  Future<AppResponse<Product>> getProduct(Session session, int id) async {
    try {
      final products = await Product.findById(
        session,
        id,
      );

      return AppResponse<Product>(
        statusCode: 200,
        data: products,
        message: "Products found",
      );
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  // add Product
  Future<AppResponse> addProduct(Session session, Product product) async {
    try {
      await Product.insert(session, product);
      return AppResponse.success("Product added");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  // update Product
  Future<AppResponse> updateProduct(Session session, Product product) async {
    try {
      await Product.update(session, product);
      return AppResponse.success("Product updated");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }

  // delete Product
  Future<AppResponse> deleteProduct(Session session, int id) async {
    try {
      await Product.delete(
        session,
        where: (t) => t.id.equals(id),
      );
      return AppResponse.success("Product deleted");
    } catch (e) {
      return AppResponse.error(e.toString());
    }
  }
}
