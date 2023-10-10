import 'package:serverpod/server.dart';
import 'package:workshop_client/workshop_client.dart' show Response;
import 'package:workshop_server/src/generated/product.dart';

class ProductEndpoint extends Endpoint {
  // getAll Products

  Future<Response<List<Product>>> getAllProducts(Session session) async {
    try {
      final products = await Product.find(
        session,
        where: (t) => t.id >= 0,
      );

      return Response<List<Product>>(
        statusCode: 200,
        data: products,
        message: "${products.length} products found",
      );
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  Future<Response<Product>> getProduct(Session session, int id) async {
    try {
      final products = await Product.findById(
        session,
        id,
      );

      return Response<Product>(
        statusCode: 200,
        data: products,
        message: "Products found",
      );
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // add Product
  Future<Response> addProduct(Session session, Product product) async {
    try {
      await Product.insert(session, product);
      return Response.success("Product added");
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // update Product
  Future<Response> updateProduct(Session session, Product product) async {
    try {
      await Product.update(session, product);
      return Response.success("Product updated");
    } catch (e) {
      return Response.error(e.toString());
    }
  }

  // delete Product
  Future<Response> deleteProduct(Session session, int id) async {
    try {
      await Product.delete(
        session,
        where: (t) => t.id.equals(id),
      );
      return Response.success("Product deleted");
    } catch (e) {
      return Response.error(e.toString());
    }
  }
}
