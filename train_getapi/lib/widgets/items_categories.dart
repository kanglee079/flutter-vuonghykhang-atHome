import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCategories extends StatelessWidget {
  int index;
  final Function()? ontap;
  ItemCategories({super.key, required this.index, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.primaries[index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.lemon,
              color: Theme.of(context).canvasColor,
            ),
            const SizedBox(height: 15),
            Text(
              "Fruits",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 5),
            const Text("45 Items"),
          ],
        ),
      ),
    );
  }
}
