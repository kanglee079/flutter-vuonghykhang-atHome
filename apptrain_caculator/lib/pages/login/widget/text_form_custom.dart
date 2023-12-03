import 'package:flutter/material.dart';

class TextFormCustom extends StatefulWidget {
  TextFormCustom({
    super.key,
    this.hintText = 'Your Email',
    this.iconPrefix = Icons.verified_user,
    this.isPassword = false,
  });

  String hintText;
  IconData iconPrefix;
  bool isPassword;

  @override
  State<TextFormCustom> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends State<TextFormCustom> {
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
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.iconPrefix),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isClickPass = !isClickPass;
                  });
                },
                child: Icon(
                  isClickPass ? Icons.remove_red_eye : Icons.remove,
                ),
              )
            : null,
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
        borderRadius: BorderRadius.circular(5.0),
      );
}
