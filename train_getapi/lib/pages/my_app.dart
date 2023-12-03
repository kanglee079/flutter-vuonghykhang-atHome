import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/apps/route/route_name.dart';
import 'package:train_getapi/apps/route/routers.dart';
import 'package:train_getapi/provider/auth_provider.dart';
import 'package:train_getapi/provider/info_provider.dart';
import 'package:train_getapi/provider/movie_provider.dart';

import '../apps/themes/theme.dart';
import '../provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()..loadThemeFromPrefs()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(
            create: (_) => InfoProvider()..getImageUrlForUser()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
