import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:train_getapi/firebase_options.dart';
import 'package:train_getapi/pages/my_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
