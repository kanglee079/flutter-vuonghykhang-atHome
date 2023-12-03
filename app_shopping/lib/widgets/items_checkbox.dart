import 'package:flutter/material.dart';

class ItemCheckbox extends StatefulWidget {
  String text;
  ItemCheckbox({
    super.key,
    required this.text,
  });

  @override
  State<ItemCheckbox> createState() => _ItemCheckboxState();
}

class _ItemCheckboxState extends State<ItemCheckbox> {
  bool isChecked = false;

  void changeCheck(Function(void Function()) setState2) {
    isChecked = !isChecked;
    setState2(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatefulBuilder(
          builder: (_, setState2) {
            return Transform.scale(
              scale: 1.4,
              child: Checkbox(
                side: BorderSide(
                  color: Theme.of(context).cardColor,
                  width: 2,
                ),
                checkColor: Colors.white,
                activeColor: Theme.of(context).cardColor,
                value: isChecked,
                onChanged: (bool? value) {
                  changeCheck(setState2);
                },
              ),
            );
          },
        ),
        Text(
          widget.text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
