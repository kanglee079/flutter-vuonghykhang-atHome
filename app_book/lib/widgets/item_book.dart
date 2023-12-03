import 'package:app_book/apps/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ItemBook extends StatelessWidget {
  String? bookName;
  String? authorName;
  String? desc;

  ItemBook({
    super.key,
    required this.bookName,
    required this.authorName,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 1),
          SlidableAction(
            onPressed: (context) {
              Get.toNamed(RouterName.editBook);
            },
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            icon: Icons.edit,
            label: 'Sửa',
          ),
          const SizedBox(width: 1),
          SlidableAction(
            onPressed: print,
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            icon: Icons.delete,
            label: 'Xoá',
          ),
        ],
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bookName ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    authorName ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    desc ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
