import 'package:flutter/material.dart';
import 'package:workshop_client/workshop_client.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.cart,
    required this.removeFromCart,
  });

  final Cart cart;

  final void Function() removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(cart.productName,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(cart.totalAmount.toString(),
                    style: Theme.of(context).textTheme.labelMedium),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: removeFromCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
