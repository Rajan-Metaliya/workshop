/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Product extends _i1.SerializableEntity {
  Product({
    this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    this.cartQty,
  });

  factory Product.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Product(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      productId: serializationManager
          .deserialize<String>(jsonSerialization['productId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      image:
          serializationManager.deserialize<String>(jsonSerialization['image']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      price:
          serializationManager.deserialize<double>(jsonSerialization['price']),
      cartQty:
          serializationManager.deserialize<int?>(jsonSerialization['cartQty']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String productId;

  String name;

  String image;

  String description;

  double price;

  int? cartQty;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'cartQty': cartQty,
    };
  }
}
