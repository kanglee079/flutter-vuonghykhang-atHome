import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handleDelete,
      required this.index})
      : super(key: key);

  var item;
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 255, 255, 130)
            : const Color.fromARGB(255, 200, 220, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4B4B4B),
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
