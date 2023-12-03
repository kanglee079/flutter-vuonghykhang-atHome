import 'package:app_getx/manage/controllers/slash_controller.dart';
import 'package:get/get.dart';

class SlashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SlashController>(SlashController());
    // TODO: implement dependencies
  }
}
