import 'package:get/get.dart';

class ThemeController extends GetxController {
  var currentTheme =
      'light'.obs; // Sử dụng RxString để quản lý trạng thái theme

  void switchTheme(String theme) {
    currentTheme.value = theme;
    // StoreService.saveTheme(theme); // Lưu theme vào SharedPreferences
  }

  @override
  void onInit() {
    super.onInit();
    loadTheme(); // Tải theme khi khởi tạo controller
  }

  void loadTheme() async {
    // String? savedTheme = await StoreService.getTheme();
    // if (savedTheme != null) {
    //   currentTheme.value = savedTheme;
    // }
  }
}
