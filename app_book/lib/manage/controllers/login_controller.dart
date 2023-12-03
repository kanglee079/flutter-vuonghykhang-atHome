import 'package:app_book/apps/const/key.dart';
import 'package:app_book/manage/services/store_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  login() {
    StoreService.to.setString(MyKey.TOKEN_USER, "hello");
  }
}
