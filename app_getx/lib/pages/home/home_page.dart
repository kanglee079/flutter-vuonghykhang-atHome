import 'package:app_getx/apps/Router/router_name.dart';
import 'package:app_getx/manage/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.increase();
                  },
                  child: const Text("+"),
                ),
                Obx(
                  () => Text("${controller.number}"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouterName.slash);
                  },
                  child: const Text("Slash"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
