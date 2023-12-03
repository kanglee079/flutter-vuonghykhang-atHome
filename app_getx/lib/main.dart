import 'package:app_getx/manage/services/store_service.dart';
import 'package:app_getx/pages/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(StoreService());

  runApp(const MyApp());
}
