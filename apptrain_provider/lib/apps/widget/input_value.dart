import 'package:flutter/material.dart';

class InputValue extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  IconData iconPrefix;
  bool isPassword;

  InputValue({
    super.key,
    required this.controller,
    this.hintText = 'Your Email',
    this.iconPrefix = Icons.verified_user,
    this.isPassword = false,
  });

  @override
  State<InputValue> createState() => _InputValueState();
}

class _InputValueState extends State<InputValue> {
  late bool isClickPass;

  @override
  void initState() {
    isClickPass = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isClickPass,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.iconPrefix),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(
                    () {
                      isClickPass = !isClickPass;
                    },
                  );
                },
                child: Icon(
                    isClickPass ? Icons.remove_red_eye : Icons.remove_circle),
              )
            : null,
        fillColor: Colors.grey,
        focusedBorder: outlineInputBorderCustom(),
        enabledBorder: outlineInputBorderCustom(),
        disabledBorder: outlineInputBorderCustom(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderCustom() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}
