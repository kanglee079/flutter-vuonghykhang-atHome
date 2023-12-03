import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final params = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(params["int"]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CategoryPage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back home"),
        ),
      ),
    );
  }
}
