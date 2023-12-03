import 'package:app_book/manage/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../widgets/button_custom.dart';
import '../../../widgets/form_login_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> keyLoginForm = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool isChecked = false;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Book Admin App",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 25),
                        FormLoginWidget(
                            keyLoginForm: keyLoginForm,
                            emailController: emailController,
                            passwordController: passwordController),
                        const SizedBox(height: 25),
                        ButtonCustom(
                          onTap: () {
                            controller.login();
                          },
                          backgroundColor: Theme.of(context).cardColor,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          textButton: 'LOGIN',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
