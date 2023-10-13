import 'package:workshop_client/workshop_client.dart';

import '../../../utils/exceptions/exceptions.dart';
import '../../service/service.dart';
import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  Future<void> addProduct(Product product) async {
    try {
      await apiServer.client.product.addProduct(product);
    } catch (e) {
      throw RepoException(message: "Failed to add product");
    }
  }

  @override
  Future<void> deleteProduct(int productId) async {
    try {
      await apiServer.client.product.deleteProduct(productId);
    } catch (e) {
      throw RepoException(message: "Failed to add product");
    }
  }

  @override
  Future<List<Product>> getProductList() async {
    try {
      final products = await apiServer.client.product.getAllProducts();

      return products;
    } catch (e) {
      throw RepoException(message: "Failed to add product");
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      await apiServer.client.product.updateProduct(product);
    } catch (e) {
      throw RepoException(message: "Failed to add product");
    }
  }
}
