import 'package:flutter/material.dart';

import 'app/routers/routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterCustom.router,
    );
  }
}
