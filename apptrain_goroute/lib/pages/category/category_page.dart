import 'package:apptrain_goroute/app/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('category'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(RouterName.articleName);
          },
          child: const Text('aricle page'),
        ),
      ),
    );
  }
}
