import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    super.key,
    this.backgroundColor = Colors.white,
    this.textStyle,
    this.textButton = 'CREATE AN ACCOUNT',
    required this.onTap,
  });
  Color backgroundColor;
  TextStyle? textStyle;
  String textButton;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.white38,
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).cardColor,
            ),
          ),
          child: Center(
            child: Text(
              textButton,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
