import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreService extends GetxService {
  static StoreService get to => Get.find();
  late SharedPreferences _prefs;
  Future<StoreService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    return _prefs.getString(key) ?? "";
  }

  Future<void> clean(String key) async {
    await _prefs.remove(key);
  }
}
