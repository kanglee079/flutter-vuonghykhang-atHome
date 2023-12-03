import 'package:app_tintuc/pages/categoryPage/caterogy_page.dart';
import 'package:app_tintuc/pages/detailPage/detail_page.dart';
import 'package:app_tintuc/pages/homePage/home_page.dart';
import 'package:app_tintuc/pages/settingPage/setting_page.dart';
import 'package:flutter/material.dart';

import '../../models/detail.dart';
import 'route_name.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homeName:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case RouterName.categoryName:
        final Map dataCategory = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return CategoryPage(
              idCategory: dataCategory["idCategory"],
              nameCategory: dataCategory["nameCategory"],
            );
          },
        );
      case RouterName.settingName:
        return MaterialPageRoute(
          builder: (context) {
            return const SettingPage();
          },
        );
      case RouterName.detailName:
        final Detail dataDetail = settings.arguments as Detail;
        return MaterialPageRoute(
          builder: (context) {
            return DetailPage(
              data: dataDetail,
            );
          },
        );
      default:
        return _errorPage();
    }
  }

  static Route _errorPage() {
    return MaterialPageRoute(builder: (context) {
      return Container();
    });
  }
}
