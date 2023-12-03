import 'package:apptrain_goroute/app/routers/router_params.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/article/article_page.dart';
import '../../pages/category/category_page.dart';
import '../../pages/home/home_page.dart';
import 'router_name.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RouterName.categoryName,
            path: RouterPath.categoryName,
            builder: (BuildContext context, GoRouterState state) {
              return const CategoryPage();
            },
          ),
        ],
      ),
      GoRoute(
        name: RouterName.articleName,
        path: RouterPath.articleName,
        builder: (BuildContext context, GoRouterState state) {
          final categoryStr = ParamCategoryPage(name: "name", title: "title");

          return const ArticlePage();
        },
      ),
    ],
  );
}
