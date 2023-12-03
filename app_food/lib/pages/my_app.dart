import 'package:app_food/pages/homePage/widget/category.dart';
import 'package:app_food/pages/homePage/widget/product.dart';
import 'package:app_food/providers/category_provider.dart';
import 'package:app_food/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_food.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          appFood.routeName: ((context) => const appFood()),
          CategoryPage.routeName: ((context) => const CategoryPage()),
          ProductPage.routeName: ((context) => const ProductPage()),
        },
      ),
    );
  }
}
