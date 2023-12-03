import 'package:app_shopping/apps/models/categories.dart';
import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/pages/checkoutPage/checkout_address_page.dart';
import 'package:app_shopping/pages/checkoutPage/checkout_payment_page.dart';
import 'package:app_shopping/pages/checkoutPage/checkout_thanks_page.dart';
import 'package:app_shopping/pages/myFavoritePage/shop_my_favorite_page.dart';
import 'package:app_shopping/pages/myOrdersPage/shop_my_orders_page.dart';
import 'package:app_shopping/pages/searchFiltersPage/shop_search_filters_page.dart';
import 'package:app_shopping/pages/searchResultPage/shop_search_result_page.dart';
import 'package:app_shopping/pages/shoppingCartPage/shop_cart_page.dart';
import 'package:flutter/material.dart';

import '../../pages/loginPage/login_page.dart';
import '../../pages/personalsPage/shop_personals_page.dart';
import '../../pages/productCategoriesPage/productDetails/shop_product_details_page.dart';
import '../../pages/productCategoriesPage/products/shop_products_page.dart';
import '../../pages/productCategoriesPage/shop_product_categories_page.dart';
import '../../pages/registerPage/sign_up_page.dart';
import '../../pages/root/root_page.dart';
import '../../pages/shopHomePage/shop_home_page.dart';
import '../../pages/shop_state_page.dart';
import 'route_name.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.rootName:
        return MaterialPageRoute(
          builder: (context) => const RootPage(),
        );

      case RouteName.loginName:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RouteName.registerName:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
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
        var argument = settings.arguments as CategoriesModels;
        if (argument.id != null) {
          return MaterialPageRoute(
            builder: (context) => ProductsWithCategoriesPage(
              categoriesId: argument.id,
              nameCategories: argument.name,
            ),
          );
        } else {
          return _errorPage();
        }
      case RouteName.detailProductName:
        var argument = settings.arguments as ProductModels;
        if (argument.id != null) {
          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              id: argument.id,
              name: argument.name,
              price: argument.price,
              price_sale_off: argument.price_sale_off,
              description: argument.description,
              image: argument.image,
              rating: argument.rating,
              special: argument.special,
              isNew: argument.isNew,
              categoryId: argument.category_id,
            ),
          );
        } else {
          return _errorPage();
        }
      case RouteName.shopPersonalName:
        return MaterialPageRoute(
          builder: (context) => const PersonalPage(),
        );
      case RouteName.searchResultName:
        return MaterialPageRoute(
          builder: (context) => const SearchResultPage(),
        );
      case RouteName.searchFiltersName:
        return MaterialPageRoute(
          builder: (context) => const SearchFiltersPage(),
        );
      case RouteName.shoppingCartName:
        return MaterialPageRoute(
          builder: (context) => const ShoppingCartPage(),
        );
      case RouteName.myOrdersName:
        return MaterialPageRoute(
          builder: (context) => const MyOrdersPage(),
        );
      case RouteName.myFavoriteName:
        return MaterialPageRoute(
          builder: (context) => const MyFavoritePage(),
        );
      case RouteName.checkoutAddressName:
        return MaterialPageRoute(
          builder: (context) => const CheckoutAddressPage(),
        );
      case RouteName.checkoutPaymentName:
        return MaterialPageRoute(
          builder: (context) => const CheckoutPaymentPage(),
        );
      case RouteName.checkoutThanksName:
        return MaterialPageRoute(
          builder: (context) => const CheckoutPageThanks(),
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
