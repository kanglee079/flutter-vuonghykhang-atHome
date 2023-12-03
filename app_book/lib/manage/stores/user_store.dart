import 'package:app_book/apps/const/key.dart';
import 'package:app_book/manage/services/store_service.dart';
import 'package:app_book/models/user_model.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  final _token = "".obs;
  final _info = UserModel().obs;

  bool get isLogin => _isLogin.value;
  String get token => _token.value;
  // String get info => _token.value;

  @override
  void onInit() async {
    String key = await StoreService.to.getString(MyKey.TOKEN_USER);
    if (key.isNotEmpty) {
      _isLogin.value = true;
      //getUser
    }

    super.onInit();
  }

  logout() {
    _isLogin.value = false;
    _token.value = "";
    StoreService.to.clean(MyKey.TOKEN_USER);
  }
}
