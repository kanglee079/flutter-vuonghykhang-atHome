import 'package:apptrain_provider/apps/provider/number_provider.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "History",
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              Consumer<NumberProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () async {
                      if (await confirm(context)) {
                        return value.deleteAllHistory();
                      }
                      return;
                    },
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.amber,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
          width: size.width * 0.95,
          height: size.height * 0.27,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Consumer<NumberProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.history.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            value.deleteHistory(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: size.width * 0.95,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                value.reversedHistory[index],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
