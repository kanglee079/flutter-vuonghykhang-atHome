import 'package:flutter/material.dart';
import 'package:train_getapi/apps/route/route_name.dart';
import 'package:train_getapi/apps/route/route_params.dart';
import 'package:train_getapi/pages/loginPage/login_page.dart';
import 'package:train_getapi/pages/movieHomePage/detailMovie/detail_movie.dart';
import 'package:train_getapi/pages/movieHomePage/info/movie_info_page.dart';
import 'package:train_getapi/pages/movieHomePage/searchPage/movie_search_page.dart';
import 'package:train_getapi/pages/movieHomePage/settingPage/movie_setting_page.dart';
import 'package:train_getapi/pages/registerPage/sign_up_page.dart';
import 'package:train_getapi/pages/root/root_page.dart';
import 'package:train_getapi/pages/shopHomePage/personalsPage/shop_personals_page.dart';
import 'package:train_getapi/pages/shopHomePage/productCategoriesPage/productDetails/shop_product_details_page.dart';
import 'package:train_getapi/pages/shopHomePage/productCategoriesPage/products/shop_products_page.dart';
import 'package:train_getapi/pages/shopHomePage/productCategoriesPage/shop_product_categories_page.dart';
import 'package:train_getapi/pages/shopHomePage/shopHomePage/shop_home_page.dart';
import 'package:train_getapi/pages/shopHomePage/shop_state_page.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.rootName:
        return MaterialPageRoute(
          builder: (context) => const RootPage(),
        );
      case RouteName.detailMovieName:
        var argument = settings.arguments as ParamsMovies;
        if (argument.id != null) {
          return MaterialPageRoute(
            builder: (context) => DetailMovie(
              id: argument.id,
            ),
          );
        } else {
          return _errorPage();
        }
      case RouteName.searchName:
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      case RouteName.loginName:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RouteName.signUpName:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case RouteName.settingName:
        return MaterialPageRoute(
          builder: (context) => const SettingPage(),
        );
      case RouteName.infoName:
        return MaterialPageRoute(
          builder: (context) => const InfoPage(),
        );
      case RouteName.shopStateName:
        return MaterialPageRoute(
          builder: (context) => const ShopStatePage(),
        );
      case RouteName.shopHomeName:
        return MaterialPageRoute(
          builder: (context) => const ShopHomePage(),
        );
      case RouteName.categoriesName:
        return MaterialPageRoute(
          builder: (context) => const ProductCategoriesPage(),
        );
      case RouteName.productWithCategoriesName:
        return MaterialPageRoute(
          builder: (context) => const ProductsWithCategoriesPage(),
        );
      case RouteName.detailProductName:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailPage(),
        );
      case RouteName.shopPersonalName:
        return MaterialPageRoute(
          builder: (context) => const PersonalPage(),
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
