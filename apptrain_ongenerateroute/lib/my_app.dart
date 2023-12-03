import 'package:flutter/material.dart';

import 'app/routers/routers.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: RouterCustom.onGenerateRoute,
    );
  }
}
