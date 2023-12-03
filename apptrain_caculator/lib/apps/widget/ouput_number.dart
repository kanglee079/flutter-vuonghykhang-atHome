import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/number_provider.dart';

class OutputNumber extends StatefulWidget {
  const OutputNumber({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<OutputNumber> createState() => _OutputNumberState();
}

class _OutputNumberState extends State<OutputNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.95,
      height: widget.size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Consumer<NumberProvider>(
          builder: (context, value, child) {
            return InkWell(
              onTap: () {},
              child: Text(value.outputResult),
            );
          },
        ),
      ),
    );
  }
}
