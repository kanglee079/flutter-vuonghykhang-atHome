import 'package:flutter/material.dart';

class ManagerStatusWidget extends StatelessWidget {
  String textNameStatus;
  String text1;
  String text2;
  String text3;
  IconData icon1;
  IconData icon2;
  IconData icon3;
  ManagerStatusWidget({
    super.key,
    required this.textNameStatus,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  textNameStatus,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(icon1),
                      const SizedBox(width: 10),
                      Text(
                        text1,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(icon2),
                      const SizedBox(width: 10),
                      Text(
                        text2,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(icon3),
                      const SizedBox(width: 10),
                      Text(
                        text3,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
