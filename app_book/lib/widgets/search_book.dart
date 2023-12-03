import 'package:flutter/material.dart';

class SearchBook extends StatelessWidget {
  String contentSearch;
  IconData icon;
  SearchBook({
    super.key,
    required this.contentSearch,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelText: contentSearch,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Icon(icon),
      ),
      style: Theme.of(context).textTheme.bodySmall,
      onChanged: (value) {},
    );
  }
}
