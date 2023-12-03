import 'package:apptrain_provider/apps/provider/number_provider.dart';
import 'package:apptrain_provider/apps/provider/theme_provider.dart';
import 'package:apptrain_provider/apps/themes/my_theme.dart';
import 'package:apptrain_provider/pages/homePage/home_page.dart';
import 'package:apptrain_provider/pages/screenLogin/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: value.isChangeTheme,
          );
        },
      ),
    );
  }
}
