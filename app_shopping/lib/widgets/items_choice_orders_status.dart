import 'package:flutter/material.dart';

class ItemsChoiceOrdersStatus extends StatelessWidget {
  String name;
  bool isChoice;
  double numberWith;
  ItemsChoiceOrdersStatus({
    super.key,
    required this.name,
    required this.isChoice,
    required this.numberWith,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 10),
          Container(
            width: numberWith,
            height: 5,
            color: isChoice
                ? Theme.of(context).cardColor
                : Theme.of(context).hintColor,
          ),
        ],
      ),
    );
  }
}
