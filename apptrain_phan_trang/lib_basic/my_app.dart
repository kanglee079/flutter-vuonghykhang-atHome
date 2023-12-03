import '../lib_basic/article/article_page.dart';
import '../lib_basic/category/category_page.dart';
import '../lib_basic/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
      routes: {
        "home": ((context) => const HomePage()),
        "category": ((context) => const CategoryPage()),
        "article": ((context) => const ArticlePage()),
      },
    );
  }
}
