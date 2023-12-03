import 'package:app_food/models/product_model.dart';
import 'package:app_food/pages/homePage/widget/category_body.dart';
import 'package:app_food/pages/homePage/widget/product.dart';
import 'package:app_food/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/const.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(data['categoryId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(data["title"]),
        backgroundColor: dColorMain,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductPage.routeName,
                    arguments: {"id": products[index].id});
              },
              child: ChangeNotifierProvider<Product>.value(
                value: products[index],
                child: const CategoryBody(),
              ));
        },
      ),
    );
  }
}
