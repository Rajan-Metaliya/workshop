/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Product extends _i1.TableRow {
  Product({
    int? id,
    required this.productId,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  }) : super(id);

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
    );
  }

  static final t = ProductTable();

  String productId;

  String name;

  String image;

  String description;

  double price;

  @override
  String get tableName => 'product';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'productId':
        productId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'image':
        image = value;
        return;
      case 'description':
        description = value;
        return;
      case 'price':
        price = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Product>> find(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Product>(
      where: where != null ? where(Product.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Product?> findSingleRow(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Product>(
      where: where != null ? where(Product.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Product?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Product>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ProductExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where != null ? where(Product.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ProductExpressionBuilder = _i1.Expression Function(ProductTable);

class ProductTable extends _i1.Table {
  ProductTable() : super(tableName: 'product');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final productId = _i1.ColumnString('productId');

  final name = _i1.ColumnString('name');

  final image = _i1.ColumnString('image');

  final description = _i1.ColumnString('description');

  final price = _i1.ColumnDouble('price');

  @override
  List<_i1.Column> get columns => [
        id,
        productId,
        name,
        image,
        description,
        price,
      ];
}

@Deprecated('Use ProductTable.t instead.')
ProductTable tProduct = ProductTable();
