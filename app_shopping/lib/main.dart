import 'package:app_shopping/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/my_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'demoapp',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
