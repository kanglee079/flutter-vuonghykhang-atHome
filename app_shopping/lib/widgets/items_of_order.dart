import 'package:flutter/material.dart';

class itemOfOrder extends StatelessWidget {
  String name;
  String image;
  int price;
  int quanity;
  itemOfOrder({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.quanity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            Text(
              "Giá: ${price.toString()}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "Số lượng: ${quanity.toString()}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        )
      ],
    );
  }
}
