import 'package:apptrain_caculator/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';

import 'app/routers/routers.dart';

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
