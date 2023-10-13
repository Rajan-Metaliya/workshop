/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:workshop_client/src/protocol/cart.dart' as _i3;
import 'package:workshop_client/src/response/response.dart' as _i4;
import 'package:workshop_client/src/protocol/product.dart' as _i5;
import 'package:workshop_client/src/protocol/user.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointCart extends _i1.EndpointRef {
  _EndpointCart(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cart';

  _i2.Future<bool> addToCart(_i3.Cart cart) => caller.callServerEndpoint<bool>(
        'cart',
        'addToCart',
        {'cart': cart},
      );

  _i2.Future<List<_i3.Cart>> getCart(int userId) =>
      caller.callServerEndpoint<List<_i3.Cart>>(
        'cart',
        'getCart',
        {'userId': userId},
      );

  _i2.Future<_i4.AppResponse<dynamic>> updateCart(_i3.Cart cart) =>
      caller.callServerEndpoint<_i4.AppResponse<dynamic>>(
        'cart',
        'updateCart',
        {'cart': cart},
      );

  _i2.Future<_i4.AppResponse<dynamic>> deleteCart(int id) =>
      caller.callServerEndpoint<_i4.AppResponse<dynamic>>(
        'cart',
        'deleteCart',
        {'id': id},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointProduct extends _i1.EndpointRef {
  _EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _i2.Future<List<_i5.Product>> getAllProducts() =>
      caller.callServerEndpoint<List<_i5.Product>>(
        'product',
        'getAllProducts',
        {},
      );

  _i2.Future<_i5.Product> getProduct(int id) =>
      caller.callServerEndpoint<_i5.Product>(
        'product',
        'getProduct',
        {'id': id},
      );

  _i2.Future<bool> addProduct(_i5.Product product) =>
      caller.callServerEndpoint<bool>(
        'product',
        'addProduct',
        {'product': product},
      );

  _i2.Future<bool> updateProduct(_i5.Product product) =>
      caller.callServerEndpoint<bool>(
        'product',
        'updateProduct',
        {'product': product},
      );

  _i2.Future<bool> deleteProduct(int id) => caller.callServerEndpoint<bool>(
        'product',
        'deleteProduct',
        {'id': id},
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i6.Users?> getUserWithEmailPassword({
    required String email,
    required String password,
  }) =>
      caller.callServerEndpoint<_i6.Users?>(
        'user',
        'getUserWithEmailPassword',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<_i6.Users> addUser(_i6.Users user) =>
      caller.callServerEndpoint<_i6.Users>(
        'user',
        'addUser',
        {'user': user},
      );

  _i2.Future<_i6.Users> updateUser(_i6.Users user) =>
      caller.callServerEndpoint<_i6.Users>(
        'user',
        'updateUser',
        {'user': user},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    cart = _EndpointCart(this);
    example = _EndpointExample(this);
    product = _EndpointProduct(this);
    user = _EndpointUser(this);
  }

  late final _EndpointCart cart;

  late final _EndpointExample example;

  late final _EndpointProduct product;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'cart': cart,
        'example': example,
        'product': product,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
