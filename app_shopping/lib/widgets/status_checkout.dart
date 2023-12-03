import 'package:flutter/material.dart';

class StatusCheckout extends StatelessWidget {
  bool isPayment;

  StatusCheckout({
    super.key,
    required this.isPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                  child: Divider(
                    color: Theme.of(context).canvasColor,
                    thickness: 3,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Deliver",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 3,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(
                    isPayment ? Icons.check : Icons.circle,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: isPayment
                        ? Theme.of(context).cardColor
                        : Theme.of(context).hintColor,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Address",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Divider(
                    color: isPayment
                        ? Theme.of(context).cardColor
                        : Theme.of(context).hintColor,
                    thickness: 3,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isPayment
                        ? Theme.of(context).cardColor
                        : Theme.of(context).hintColor,
                  ),
                  child: Icon(
                    isPayment ? Icons.circle : Icons.circle,
                    color: isPayment
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Payment",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ],
    );
  }
}
