import 'package:flutter/material.dart';

class ItemDropdown extends StatelessWidget {
  Widget dropDown;
  ItemDropdown({
    super.key,
    required this.dropDown,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Tên thể loại: ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(flex: 2, child: dropDown),
      ],
    );
  }
}
