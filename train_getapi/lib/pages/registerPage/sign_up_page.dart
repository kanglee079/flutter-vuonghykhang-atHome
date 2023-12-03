import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/provider/auth_provider.dart';
import 'package:train_getapi/widgets/button_custom.dart';
import 'package:train_getapi/widgets/touch_dismiss_keyboard.dart';

import '../../widgets/text_form_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _keyLoginForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleRegister() async {
    context
        .read<AuthProvider>()
        .register(_emailController.text, _passwordController.text)
        .onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
      return null;
    }).then((value) {
      if (value != null) {
        Navigator.pop(context);
      }
    });
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
            const SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
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
                          "Create your account",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _keyLoginForm,
                          child: Column(
                            children: [
                              TextFormCustom(
                                controller: _nameController,
                                hintText: 'Your Name',
                                errorCheck: 'name',
                              ),
                              const SizedBox(height: 20),
                              TextFormCustom(
                                controller: _emailController,
                                hintText: 'Your Email',
                                iconPrefix: Icons.email,
                                errorCheck: 'email',
                              ),
                              const SizedBox(height: 20),
                              TextFormCustom(
                                controller: _passwordController,
                                hintText: 'Your Password',
                                iconPrefix: Icons.lock,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        ButtonCustom(
                          onTap: handleRegister,
                          backgroundColor: Theme.of(context).cardColor,
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          textButton: "REGISTER",
                        ),
                        const SizedBox(height: 10),
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
                                "By tapping “Sign Up” you accept our terms and condition",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Already have account?",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonCustom(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          textButton: "BACK TO LOGIN",
                          backgroundColor: Theme.of(context).canvasColor,
                        )
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
