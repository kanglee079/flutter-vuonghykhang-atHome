import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxInt number = 0.obs;

  increase() => number++;
  decrease() => number--;
}
