import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreService extends GetxService {
  late SharedPreferences _prefs;

  @override
  void onReady() async {
    _prefs = await SharedPreferences.getInstance();
    print("onready");
    super.onReady();
  }

  Future<String> getString(String key) async {
    // _prefs.getString(key);
    return 'success';
  }
}
