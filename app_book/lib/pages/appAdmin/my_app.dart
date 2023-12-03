import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apps/route/route_custom.dart';
import '../../apps/route/route_name.dart';
import '../../apps/theme/theme.dart';
import '../../manage/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var themeController = Get.find<ThemeController>();
      return GetMaterialApp(
        theme: themeController.currentTheme.value == 'light'
            ? MyTheme.lightTheme
            : MyTheme.darkTheme,
        initialRoute: RouterName.login,
        getPages: RouterCustom.getPage,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
