import 'package:flutter/material.dart';

class ItemCategories extends StatelessWidget {
  int id;
  String name;
  String image;
  int index;
  final Function()? ontap;
  ItemCategories({
    super.key,
    required this.index,
    required this.ontap,
    required this.id,
    required this.name,
    required this.image,
  });

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
            Image.network(
              image,
              fit: BoxFit.contain,
              width: 80,
              height: 50,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 5),
            const Text("10 Items"),
          ],
        ),
      ),
    );
  }
}
