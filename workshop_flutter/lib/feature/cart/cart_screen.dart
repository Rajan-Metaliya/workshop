import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../ui/widgets/cart_widget.dart';
import 'bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(CartFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: LiquidPullToRefresh(
                      onRefresh: () async {
                        context
                            .read<CartBloc>()
                            .add(CartFetchEvent(isRefresh: true));
                      },
                      child: ListView.builder(
                        itemCount: state.carts.length,
                        itemBuilder: (context, index) {
                          final cart = state.carts[index];
                          return CartWidget(
                              cart: cart,
                              removeFromCart: (value) {
                                context.read<CartBloc>().add(
                                      CartRemoveItemEvent(cart, value),
                                    );
                              });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // total price
                  Container(
                      height: 56,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text("Total Price: ",
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(state.totalPrice.toString(),
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ))
                ],
              );
            } else if (state is CartErrorState) {
              return Center(
                child: Text(state.error),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
