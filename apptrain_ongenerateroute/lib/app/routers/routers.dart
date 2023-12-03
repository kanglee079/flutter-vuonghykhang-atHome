import 'package:flutter/material.dart';

import '../../pages/article/article_page.dart';
import '../../pages/category/category_page.dart';
import 'router_name.dart';
import 'router_params.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.categoryName:
        var argument = settings.arguments as ParamCategoryPage;
        if (argument.title != null) {
          return MaterialPageRoute(
            builder: (context) => CategoryPage(
              name: argument.name,
              title: argument.title,
            ),
          );
        } else {
          return _errorPage();
        }
      case RouterName.articleName:
        return MaterialPageRoute(
          builder: (context) {
            return const ArticlePage();
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
