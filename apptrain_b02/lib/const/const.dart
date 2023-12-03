import 'package:flutter/material.dart';

Widget setSpaceHeight(Size size, {height = 0.02}) => SizedBox(
      height: size.height * height,
    );

Widget setSpaceWeight(Size size, {width = 0.02}) => SizedBox(
      width: size.width * width,
    );
