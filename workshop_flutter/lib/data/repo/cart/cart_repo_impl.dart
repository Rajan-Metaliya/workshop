import 'package:flutter/material.dart';
import 'package:workshop_client/workshop_client.dart';

import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final List<Cart> _cartList = <Cart>[];

  @override
  Future<void> addCart(Cart cart) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    _cartList.add(cart.copyWith(id: _cartList.length));
    debugPrint(_cartList.length.toString());
  }

  @override
  Future<void> deleteCart(Cart cart) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    _cartList.remove(cart);
  }

  @override
  Future<List<Cart>> getCartList() async {
    // await Future.delayed(const Duration(milliseconds: 500));
    return _cartList;
  }

  @override
  Future<void> updateCart(Cart cart) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    final index = _cartList.indexWhere((element) => element.id == cart.id);
    _cartList[index] = cart;
  }
}
