import 'package:apptrain_provider/apps/widget/input_value.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      InputValue(
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputValue(
                        controller: passwordController,
                        hintText: 'Your Password',
                        iconPrefix: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputValue(
                        controller: passwordController,
                        hintText: 'Your Password confirm',
                        iconPrefix: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
