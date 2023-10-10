import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/route_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.goNamed(RoutePath.cart);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Product List'),
      ),
    );
  }
}
