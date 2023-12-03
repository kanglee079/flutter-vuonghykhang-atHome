import 'package:app_book/apps/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ItemCategory extends StatelessWidget {
  String? nameCategory;
  int index;
  ItemCategory({
    super.key,
    required this.index,
    required this.nameCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 2),
          SlidableAction(
            onPressed: (context) => Get.toNamed(RouterName.editCategory),
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            icon: Icons.edit,
            label: 'Sửa',
          ),
          const SizedBox(width: 2),
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
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.primaries[index],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(nameCategory ?? ""),
        ),
      ),
    );
  }
}
