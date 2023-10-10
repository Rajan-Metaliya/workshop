/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'cart.dart' as _i2;
import 'example.dart' as _i3;
import 'product.dart' as _i4;
import 'user.dart' as _i5;
export 'cart.dart';
export 'example.dart';
export 'product.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Cart) {
      return _i2.Cart.fromJson(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i4.Product) {
      return _i4.Product.fromJson(data, this) as T;
    }
    if (t == _i5.Users) {
      return _i5.Users.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Cart?>()) {
      return (data != null ? _i2.Cart.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Product?>()) {
      return (data != null ? _i4.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Users?>()) {
      return (data != null ? _i5.Users.fromJson(data, this) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Cart) {
      return 'Cart';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Product) {
      return 'Product';
    }
    if (data is _i5.Users) {
      return 'Users';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Cart') {
      return deserialize<_i2.Cart>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i4.Product>(data['data']);
    }
    if (data['className'] == 'Users') {
      return deserialize<_i5.Users>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
