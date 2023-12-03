import 'package:apptrain_b01/app/provider/number_provider.dart';
import 'package:apptrain_b01/app/provider/theme_provider.dart';
import 'package:apptrain_b01/app/theme/my_theme.dart';
import 'package:apptrain_b01/pages/home/train/bt01.dart';
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
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: value.isChangeTheme,
            debugShowCheckedModeBanner: false,
            home: const BT01(),
          );
        },
      ),
    );
  }
}
