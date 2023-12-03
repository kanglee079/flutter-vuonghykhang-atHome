import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputNumber extends StatelessWidget {
  TextEditingController controller;
  String title;

  InputNumber({
    super.key,
    required this.controller,
    this.title = 'Number One',
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.02),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: outlineInputBorderCustom(),
          enabledBorder: outlineInputBorderCustom(),
          disabledBorder: outlineInputBorderCustom(),
          labelText: title,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderCustom() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(7),
      );
}
