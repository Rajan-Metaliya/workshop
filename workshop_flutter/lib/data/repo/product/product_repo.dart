import 'package:workshop_client/workshop_client.dart';

abstract class ProductRepo {
  Future<List<Product>> getProductList(String userId);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(int productId);
}
