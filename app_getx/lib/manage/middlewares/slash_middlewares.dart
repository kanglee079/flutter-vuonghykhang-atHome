import 'package:app_getx/apps/Router/router_name.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/route_manager.dart';

class SlashMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLogin = true;
    if (isLogin) {
      return RouteSettings(name: RouterName.home);
    } else {
      return RouteSettings(name: RouterName.slash);
    }
  }
}
