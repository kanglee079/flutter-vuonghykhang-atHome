import 'package:flutter/material.dart';

import 'widget/text_form_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormCustom(),
                  const SizedBox(height: 40),
                  TextFormCustom(
                    hintText: 'Your Password',
                    iconPrefix: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Login')))
          ],
        ),
      ),
    );
  }
}
