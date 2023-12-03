import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class ItemsPersonal extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final String nameItem;
  final bool isSwitchItem;
  final bool isLanguage;
  final String textSecond;
  final Function()? ontap;
  const ItemsPersonal({
    super.key,
    required this.icon,
    this.colorIcon = Colors.black,
    required this.nameItem,
    this.isSwitchItem = false,
    this.isLanguage = false,
    this.textSecond = "English (US)",
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
              color: colorIcon,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                nameItem,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            if (isLanguage)
              Text(
                textSecond,
                style: Theme.of(context).textTheme.titleSmall,
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
