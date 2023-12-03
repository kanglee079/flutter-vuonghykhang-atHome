import 'package:flutter/material.dart';

import '../../app/routers/router_name.dart';
import '../../app/routers/router_params.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    int number = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouterName.categoryName,
                arguments: ParamCategoryPage(name: 'vanduy', title: 'laksjhd'));
          },
          child: const Text(
            'change page',
          ),
        ),
      ),
    );
  }
}
