import 'package:workshop_client/workshop_client.dart';

abstract class ProductRepo {
  Future<List<Product>> getProductList();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(int productId);
}
