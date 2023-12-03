import 'package:app_traingetit/apps/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});
  @override
  Widget build(BuildContext context) {
    final Couter otherCounter = Get.find();
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
                    otherCounter.decrease();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Obx(
                  () => Text(
                    "${otherCounter.count}",
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    otherCounter.increase();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
