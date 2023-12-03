import '../../lib_basic/category/category_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int number = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "category",
                arguments: {"int": number});
          },
          child: const Text("Change page"),
        ),
      ),
    );
  }
}
