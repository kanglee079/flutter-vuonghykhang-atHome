import 'package:app_book/apps/route/route_name.dart';
import 'package:app_book/manage/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddlewares extends GetMiddleware {
  @override
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    bool isLogin = UserStore.to.isLogin;
    if (isLogin) {
      return RouteSettings(name: RouterName.nav);
    } else {
      return null;
    }
  }
}
