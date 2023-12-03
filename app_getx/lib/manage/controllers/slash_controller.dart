import 'package:get/get.dart';

import '../../apps/Router/router_name.dart';

class SlashController extends GetxController {
  final _check = 0.obs;

  int get check => _check.value;

  Future<void> login(int number) async {
    Get.offAndToNamed(
      RouterName.home,
    );
  }
}
