import 'package:workshop_client/workshop_client.dart';

import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final List<Product> _productList = List.generate(
    20,
    (index) => Product(
      name: "Product $index",
      image: "https://picsum.photos/200/300",
      description: "Description $index " * 10,
      price: 10.0 * index,
    ),
  );

  @override
  Future<void> addProduct(Product product) async {
    // await Future.delayed(const Duration(milliseconds: 500));

    _productList.add(product.copyWith(id: _productList.length));
  }

  @override
  Future<void> deleteProduct(Product product) async {
    // await Future.delayed(const Duration(milliseconds: 500));

    _productList.add(product.copyWith(id: _productList.length));
  }

  @override
  Future<List<Product>> getProductList() async {
    // await Future.delayed(const Duration(milliseconds: 500));
    return _productList;
  }

  @override
  Future<void> updateProduct(Product product) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    final index =
        _productList.indexWhere((element) => element.id == product.id);
    _productList[index] = product;
  }
}
