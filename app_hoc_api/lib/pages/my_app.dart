import 'package:app_hoc_api/pages/homePage/home_page.dart';
import 'package:app_hoc_api/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
