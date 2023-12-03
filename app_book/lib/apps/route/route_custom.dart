import 'package:app_book/manage/bindings/login_binding.dart';
import 'package:app_book/manage/middlewares/auth_middleware.dart';
import 'package:app_book/pages/appAdmin/addBookPage/add_book_page.dart';
import 'package:app_book/pages/appAdmin/addCategoryPage/add_category_page.dart';
import 'package:app_book/pages/appAdmin/adminBookPage/admin_book_page.dart';
import 'package:app_book/pages/appAdmin/adminCategoryPage/admin_category_page.dart';
import 'package:app_book/pages/appAdmin/adminPage/admin_page.dart';
import 'package:app_book/pages/appAdmin/editBookPage/edit_book_page.dart';
import 'package:app_book/pages/appAdmin/editCategoryPage/edit_category_page.dart';
import 'package:app_book/pages/appAdmin/loginPage/login_page.dart';
import 'package:app_book/pages/appAdmin/navigator_page.dart';
import 'package:app_book/pages/appAdmin/settingPage/setting_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/appAdmin/homePage/home_page.dart';
import 'route_name.dart';

class RouterCustom {
  static List<GetPage> getPage = [
    GetPage(
      name: RouterName.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
      middlewares: [
        AuthMiddlewares(),
      ],
    ),
    GetPage(
      name: RouterName.nav,
      page: () => const NavigatorPage(),
    ),
    GetPage(
      name: RouterName.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouterName.admin,
      page: () => const AdminPage(),
    ),
    GetPage(
      name: RouterName.setting,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: RouterName.adminBook,
      page: () => const AdminBookPage(),
    ),
    GetPage(
      name: RouterName.adminCategory,
      page: () => const AdminCategoryPage(),
    ),
    GetPage(
      name: RouterName.addBook,
      page: () => const AddBookPage(),
    ),
    GetPage(
      name: RouterName.addCaterogy,
      page: () => const AddCategoryPage(),
    ),
    GetPage(
      name: RouterName.editBook,
      page: () => const EditBookPage(),
    ),
    GetPage(
      name: RouterName.editCategory,
      page: () => const EditCategoryPage(),
    ),
  ];
}
