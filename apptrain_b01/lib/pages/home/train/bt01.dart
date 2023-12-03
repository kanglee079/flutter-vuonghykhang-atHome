import 'package:apptrain_b01/app/provider/number_provider.dart';
import 'package:apptrain_b01/app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BT01 extends StatelessWidget {
  const BT01({super.key});

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NumberProvider>(
              builder: (context, value, child) {
                return Text(
                  value.number.toString(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<NumberProvider>().uncreNumber();
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<NumberProvider>().decreNumber();
                  },
                  child: const Text('-'),
                ),
              ],
            ),
            Consumer<ThemeProvider>(
              builder: (context, value, child) {
                return Switch(
                  value: value.switchchange,
                  onChanged: (bool s) {
                    value.changeTheme();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
