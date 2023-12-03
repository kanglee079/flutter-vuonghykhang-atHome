import 'package:flutter/material.dart';

class TextFormCustom extends StatefulWidget {
  TextFormCustom({
    super.key,
    this.hintText = 'Your Account',
    this.iconPrefix = Icons.person,
    this.isPassword = false,
    this.errorCheck,
    required this.controller,
  });

  String hintText;
  IconData iconPrefix;
  bool isPassword;
  String? errorCheck;
  TextEditingController controller;

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
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          print('Vui long nhap du lieu');
        }
        // switch (widget.errorCheck) {
        //   case 'email':
        //     final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
        //     if (!emailValid) {
        //       return 'Khong phai la email';
        //     }
        //     break;
        //   default:
        // }
        return null;
      },
      obscureText: isClickPass,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodySmall,
        fillColor: const Color(0xFFE8EFF3),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade700),
        prefixIcon: Icon(
          widget.iconPrefix,
          color: Colors.grey.shade700,
        ),
        filled: true,
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
        errorBorder: outlineInputBorderCustom(),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: Theme.of(context).cardColor)),
        enabledBorder: outlineInputBorderCustom(),
        disabledBorder: outlineInputBorderCustom(),
        focusedErrorBorder: outlineInputBorderCustom(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderCustom() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFE8EFF3),
        ),
        borderRadius: BorderRadius.circular(14.0),
      );
}
