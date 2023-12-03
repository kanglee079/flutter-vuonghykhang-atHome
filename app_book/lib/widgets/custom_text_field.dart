import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String nameField;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.controller,
    required this.nameField,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            nameField,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              suffixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
