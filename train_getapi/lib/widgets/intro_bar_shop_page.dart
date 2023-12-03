import 'package:flutter/material.dart';

class IntoBar extends StatelessWidget {
  const IntoBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Louis A. 👋",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 86,
                height: 46,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(54),
                ),
              ),
              Positioned(
                top: 13,
                left: 20,
                child: Text(
                  "6",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  width: 46,
                  height: 46.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(54),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
