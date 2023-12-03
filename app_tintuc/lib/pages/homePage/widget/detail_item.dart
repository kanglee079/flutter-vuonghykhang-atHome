import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../apps/config/const.dart';
import '../../../apps/route/route_name.dart';
import '../../../models/detail.dart';

class DetailItem extends StatelessWidget {
  Detail data;
  DetailItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.detailName, arguments: data);
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data.thumb ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? 'Default',
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  data.description ?? 'Default',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  data.publish_date ?? 'Default',
                  style: styleTextMini,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
