import 'package:app_book/manage/controllers/theme_controller.dart';
import 'package:app_book/manage/services/store_service.dart';
import 'package:app_book/manage/stores/user_store.dart';
import 'package:app_book/pages/appAdmin/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'demoapp',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut<ThemeController>(() => ThemeController());
  await Get.putAsync(() => StoreService().init());
  Get.put(UserStore());
  runApp(const MyApp());
}
