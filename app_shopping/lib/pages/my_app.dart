import 'package:app_shopping/provider/cart_provider.dart';
import 'package:app_shopping/provider/categories_provider.dart';
import 'package:app_shopping/provider/favorite_provider.dart';
import 'package:app_shopping/provider/product_popular_provider.dart';
import 'package:app_shopping/provider/product_w_categories_provider.dart';
import 'package:app_shopping/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../apps/route/route.dart';
import '../apps/route/route_name.dart';
import '../apps/theme/theme.dart';
import '../provider/auth_provider.dart';
import '../provider/info_provider.dart';
import '../provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()..loadThemeFromPrefs()),
        ChangeNotifierProvider(
            create: (_) => InfoProvider()..getImageUrlForUser()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProductWCategoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProductPopularProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: value.isChangeTheme,
            initialRoute: RouteName.rootName,
            onGenerateRoute: RouterCustom.onGenerateRoute,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
