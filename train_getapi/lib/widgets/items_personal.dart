import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/provider/theme_provider.dart';

class ItemsPersonal extends StatelessWidget {
  final IconData icon;
  final String nameItem;
  final bool isSwitchItem;
  final bool isLanguage;
  final Function()? ontap;
  const ItemsPersonal({
    super.key,
    required this.icon,
    required this.nameItem,
    this.isSwitchItem = false,
    this.isLanguage = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 29,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                nameItem,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            if (isLanguage)
              Text(
                "English (US)",
                style: Theme.of(context).textTheme.displaySmall,
              )
            else
              const Text(""),
            const SizedBox(width: 15),
            if (isSwitchItem)
              Consumer<ThemeProvider>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      Switch(
                        value: value.switchTheme,
                        onChanged: (s) {
                          value.changeTheme();
                        },
                      ),
                    ],
                  );
                },
              )
            else
              const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
