import 'package:app_b09/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/StreamProvider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumberProvider()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
