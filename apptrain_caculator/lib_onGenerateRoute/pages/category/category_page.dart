import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  String name;
  String title;
  CategoryPage({super.key, required this.name, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('back home'),
        ),
      ),
    );
  }
}
