import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/apps/route/route_name.dart';

import '../../../provider/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Icon(value.switchTheme ? Icons.light_mode : Icons.dark_mode),
                  Switch(
                    value: value.switchTheme,
                    onChanged: (s) {
                      value.changeTheme();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.infoName);
              },
              child: const Text("Thông tin người dùng"),
            ),
          ],
        ),
      ),
    );
  }
}
