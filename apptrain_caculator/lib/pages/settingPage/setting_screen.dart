import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../apps/provider/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình cài đặt'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Theme Mode"),
            Consumer<ThemeProvider>(
              builder: (context, value, child) {
                return Switch(
                  value: value.switchTheme,
                  onChanged: (bool s) {
                    value.changeTheme();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
