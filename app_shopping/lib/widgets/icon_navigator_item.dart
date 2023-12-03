import 'package:flutter/material.dart';

class IconNavigatorItem extends StatelessWidget {
  IconData icon;
  IconNavigatorItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 34,
    );
  }
}
