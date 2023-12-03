import 'package:flutter/material.dart';

import '../../../widgets/text_form_custom.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    super.key,
    required GlobalKey<FormState> keyLoginForm,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _keyLoginForm = keyLoginForm,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _keyLoginForm;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyLoginForm,
      child: Column(
        children: [
          TextFormCustom(
            controller: _emailController,
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
    );
  }
}
