import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Operators extends StatelessWidget {
  Operators({
    super.key,
    required this.size,
    required this.handleSubmit,
  });

  Function handleSubmit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () => handleSubmit('+'),
            child: const Text('+'),
          ),
          ElevatedButton(
            onPressed: () => handleSubmit('-'),
            child: const Text('-'),
          ),
          ElevatedButton(
            onPressed: () => handleSubmit('*'),
            child: const Text('x'),
          ),
          ElevatedButton(
            onPressed: () => handleSubmit('/'),
            child: const Text(':'),
          ),
        ],
      ),
    );
  }
}
