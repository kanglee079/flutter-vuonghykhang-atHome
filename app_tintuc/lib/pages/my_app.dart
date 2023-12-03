import 'package:app_tintuc/apps/theme/my_theme.dart';
import 'package:app_tintuc/provider/category_provider.dart';
import 'package:app_tintuc/provider/detail_provider.dart';
import 'package:app_tintuc/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../apps/route/route.dart';
import '../apps/route/route_name.dart';
import '../provider/setting_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SettingProvider()..getDataInShare()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => DetailProvider()),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()..loadThemeFromPrefs()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            initialRoute: RouterName.homeName,
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: value.isChangeTheme,
            onGenerateRoute: RouterCustom.onGenerateRoute,
          );
        },
      ),
    );
  }
}
