import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../app/routes/route_path.dart';
import '../../ui/widgets/product_widget.dart';
import 'bloc/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(ProductFetchEvent()),
      child: Builder(builder: (context) {
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
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductLoadedState) {
                return LiquidPullToRefresh(
                  onRefresh: () async {
                    context.read<ProductBloc>().add(ProductFetchEvent());
                  },
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductWidget(
                          product: product,
                          addToCart: (value) {
                            context.read<ProductBloc>().add(
                                  ProductAddToCartEvent(product, value),
                                );
                          });
                    },
                  ),
                );
              } else if (state is ProductErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ProductBloc>().add(ProductAddProductEvent());
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
