import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routers/router_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(RouterName.categoryName);
          },
          child: const Text(
            'change page',
          ),
        ),
      ),
    );
  }
}
