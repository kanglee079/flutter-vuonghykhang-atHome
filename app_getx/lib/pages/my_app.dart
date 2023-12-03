import 'package:app_getx/apps/Router/router_custom.dart';
import 'package:app_getx/apps/Router/router_name.dart';
import 'package:app_getx/manage/bindings/home_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouterName.slash,
      initialBinding: HomeBinding(),
      getPages: RouterCustom.getPage,
    );
  }
}
