import 'package:app_tintuc/apps/config/const.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../models/detail.dart';

class DetailPage extends StatelessWidget {
  Detail data;
  DetailPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: dColorMain,
          title: const Text(
            "Thông tin bài viết",
            style: styleCategoryPageTitle,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.thumb ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.title ?? "",
                style: styleTitleItemLight,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(data.content ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
