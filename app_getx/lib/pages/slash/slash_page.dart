import 'package:app_getx/manage/controllers/slash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlashPage extends GetView<SlashController> {
  const SlashPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.login(1);
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
