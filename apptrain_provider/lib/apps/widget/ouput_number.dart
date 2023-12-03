import 'package:apptrain_provider/apps/provider/number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutputNumber extends StatelessWidget {
  const OutputNumber({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.95,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Consumer<NumberProvider>(
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.numberOne = value.result;
              },
              child: Text(
                value.elResult(),
              ),
            );
          },
        ),
      ),
    );
  }
}
