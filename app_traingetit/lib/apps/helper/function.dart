import 'package:get/state_manager.dart';

class Couter extends GetxController {
  RxInt count = 0.obs;

  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }
}
