import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/apps/route/route_name.dart';
import 'package:train_getapi/provider/auth_provider.dart';

import '../../widgets/button_custom.dart';
import '../../widgets/touch_dismiss_keyboard.dart';
import 'loginWidget/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _keyLoginForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleLogin() async {
    EasyLoading.show(status: 'loading...');
    await Future.delayed(const Duration(milliseconds: 600));
    EasyLoading.dismiss();

    context
        .read<AuthProvider>()
        .login(_emailController.text, _passwordController.text)
        .onError(
      (error, stackTrace) {
        print(error);
        EasyLoading.showError(error.toString());
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return TouchOutsideToDismissKeyboard(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Grocery App",
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
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 25),
                        FormLoginWidget(
                            keyLoginForm: _keyLoginForm,
                            emailController: _emailController,
                            passwordController: _passwordController),
                        const SizedBox(height: 25),
                        ButtonCustom(
                          onTap: handleLogin,
                          backgroundColor: Theme.of(context).cardColor,
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          textButton: 'LOGIN',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: isChecked,
                              onChanged: (bool? value) {},
                            ),
                            Expanded(
                              child: Text(
                                "Keep Sign In",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: Text(
                            "Don’t have an account?",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonCustom(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.signUpName);
                          },
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          backgroundColor: Theme.of(context).canvasColor,
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
