import 'package:apptrain_goroute/app/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticlePage'),
      ),
      body: Center(
        child: InkWell(
          child: ElevatedButton(
            onPressed: () {
              context.goNamed(
                RouterName.categoryName,
              );
            },
            child: const Text("Back"),
          ),
        ),
      ),
    );
  }
}
