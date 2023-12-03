import 'package:flutter/material.dart';

const dLightMainColor = Color(0xFF027335);
const dDarkMainColor = Color(0xFFF99B06);

OutlineInputBorder outlineInputBorderCustom() => OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );
