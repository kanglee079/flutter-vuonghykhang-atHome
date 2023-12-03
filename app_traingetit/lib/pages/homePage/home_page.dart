import 'package:app_traingetit/apps/helper/function.dart';
import 'package:app_traingetit/pages/otherPage/other_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final counter = Get.put(Couter());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    counter.decrease();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Obx(
                  () => Text(
                    "${counter.count}",
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    counter.increase();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(const OtherPage());
              },
              child: const Text("To Other Page"),
            )
          ],
        ),
      ),
    );
  }
}
