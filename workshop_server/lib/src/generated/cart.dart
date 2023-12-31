/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Cart extends _i1.TableRow {
  Cart({
    int? id,
    required this.cartId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.productAmount,
    required this.totalAmount,
  }) : super(id);

  factory Cart.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Cart(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      cartId:
          serializationManager.deserialize<String>(jsonSerialization['cartId']),
      userId:
          serializationManager.deserialize<String>(jsonSerialization['userId']),
      productId: serializationManager
          .deserialize<String>(jsonSerialization['productId']),
      productName: serializationManager
          .deserialize<String>(jsonSerialization['productName']),
      quantity:
          serializationManager.deserialize<int>(jsonSerialization['quantity']),
      productAmount: serializationManager
          .deserialize<double>(jsonSerialization['productAmount']),
      totalAmount: serializationManager
          .deserialize<double>(jsonSerialization['totalAmount']),
    );
  }

  static final t = CartTable();

  String cartId;

  String userId;

  String productId;

  String productName;

  int quantity;

  double productAmount;

  double totalAmount;

  @override
  String get tableName => 'cart';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cartId': cartId,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'productAmount': productAmount,
      'totalAmount': totalAmount,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'cartId': cartId,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'productAmount': productAmount,
      'totalAmount': totalAmount,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'cartId': cartId,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'productAmount': productAmount,
      'totalAmount': totalAmount,
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
      case 'cartId':
        cartId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'productId':
        productId = value;
        return;
      case 'productName':
        productName = value;
        return;
      case 'quantity':
        quantity = value;
        return;
      case 'productAmount':
        productAmount = value;
        return;
      case 'totalAmount':
        totalAmount = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Cart>> find(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Cart>(
      where: where != null ? where(Cart.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cart?> findSingleRow(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Cart>(
      where: where != null ? where(Cart.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cart?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Cart>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CartExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cart>(
      where: where(Cart.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cart>(
      where: where != null ? where(Cart.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CartExpressionBuilder = _i1.Expression Function(CartTable);

class CartTable extends _i1.Table {
  CartTable() : super(tableName: 'cart');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final cartId = _i1.ColumnString('cartId');

  final userId = _i1.ColumnString('userId');

  final productId = _i1.ColumnString('productId');

  final productName = _i1.ColumnString('productName');

  final quantity = _i1.ColumnInt('quantity');

  final productAmount = _i1.ColumnDouble('productAmount');

  final totalAmount = _i1.ColumnDouble('totalAmount');

  @override
  List<_i1.Column> get columns => [
        id,
        cartId,
        userId,
        productId,
        productName,
        quantity,
        productAmount,
        totalAmount,
      ];
}

@Deprecated('Use CartTable.t instead.')
CartTable tCart = CartTable();
