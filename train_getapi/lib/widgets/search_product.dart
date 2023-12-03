import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  final Function()? ontap;
  const SearchProduct({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Icon(
              Icons.search,
              color: Colors.grey,
              size: 35,
            ),
            const SizedBox(width: 10),
            Text(
              "Search beverages or foods",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
