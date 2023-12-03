import 'package:apptrain_provider/apps/provider/number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Operators extends StatelessWidget {
  const Operators({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.95,
      child: Consumer<NumberProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  value.performOperation("+");
                },
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  value.performOperation("-");
                },
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () {
                  value.performOperation("x");
                },
                child: const Text('x'),
              ),
              ElevatedButton(
                onPressed: () {
                  value.performOperation(":");
                },
                child: const Text(':'),
              ),
            ],
          );
        },
      ),
    );
  }
}
