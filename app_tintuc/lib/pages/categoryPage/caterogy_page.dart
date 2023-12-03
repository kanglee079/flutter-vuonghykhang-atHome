import 'package:app_tintuc/apps/config/const.dart';
import 'package:app_tintuc/models/detail.dart';
import 'package:app_tintuc/pages/homePage/widget/detail_item.dart';
import 'package:app_tintuc/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  int idCategory;
  String nameCategory;

  CategoryPage(
      {super.key, required this.idCategory, required this.nameCategory});
  @override
  Widget build(BuildContext context) {
    print(idCategory);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        elevation: 0,
        title: Text(
          nameCategory,
          style: styleCategoryPageTitle,
        ),
      ),
      body: FutureBuilder(
        future:
            context.read<DetailProvider>().getApiDetail(idCategory, limit: 10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) return Container();
          List<Detail> data = snapshot.data as List<Detail>;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 15, color: Colors.white);
              },
              itemBuilder: (BuildContext context, int index) {
                return AspectRatio(
                  aspectRatio: 3 / 0.85,
                  child: DetailItem(data: data[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
