/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Cart extends _i1.SerializableEntity {
  Cart({
    this.id,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.totalAmount,
  });

  factory Cart.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Cart(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      productId:
          serializationManager.deserialize<int>(jsonSerialization['productId']),
      productName: serializationManager
          .deserialize<String>(jsonSerialization['productName']),
      quantity:
          serializationManager.deserialize<int>(jsonSerialization['quantity']),
      totalAmount: serializationManager
          .deserialize<double>(jsonSerialization['totalAmount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int productId;

  String productName;

  int quantity;

  double totalAmount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'totalAmount': totalAmount,
    };
  }

  Cart copyWith({
    int? id,
    int? userId,
    int? productId,
    String? productName,
    int? quantity,
    double? totalAmount,
  }) {
    return Cart(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
