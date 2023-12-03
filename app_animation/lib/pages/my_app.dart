import 'package:app_animation/pages/animation/04/day01.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      home: const Day01(),
    );
  }
}
