import 'package:flutter/material.dart';

class QuantityInputWidget extends StatelessWidget {
  const QuantityInputWidget({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  final int quantity;

  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    if (quantity == 0) {
      return ElevatedButton(
        onPressed: () {
          onChanged(quantity + 1);
        },
        child: const Text('Add'),
      );
    }
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              onChanged(quantity - 1);
            },
            child: const Text('-'),
          ),
        ),
        const SizedBox(width: 10),
        Text('$quantity'),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              onChanged(quantity + 1);
            },
            child: const Text('+'),
          ),
        ),
      ],
    );
  }
}
