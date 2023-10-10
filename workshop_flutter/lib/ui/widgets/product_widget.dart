import 'package:flutter/material.dart';
import 'package:workshop_client/workshop_client.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.addToCart,
  });

  final Product product;

  final void Function() addToCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(product.description,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(product.price.toString(),
                    style: Theme.of(context).textTheme.labelMedium),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: addToCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
