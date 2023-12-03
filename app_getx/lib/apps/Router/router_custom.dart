import 'package:app_getx/apps/Router/router_name.dart';
import 'package:app_getx/manage/bindings/home_bindings.dart';
import 'package:app_getx/manage/bindings/slash_bindings.dart';
import 'package:app_getx/pages/home/home_page.dart';
import 'package:app_getx/pages/slash/slash_page.dart';
import 'package:get/route_manager.dart';

import '../../manage/middlewares/slash_middlewares.dart';

class RouterCustom {
  static List<GetPage> getPage = [
    GetPage(
      name: RouterName.slash,
      page: () => const SlashPage(),
      binding: SlashBinding(),
      middlewares: [
        SlashMiddlewares(),
      ],
    ),
    GetPage(
      name: RouterName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
