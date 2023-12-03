import 'package:flutter/material.dart';
import 'package:train_getapi/apps/route/route_name.dart';

import '../../../widgets/items_categories.dart';

class ProductCategoriesPage extends StatelessWidget {
  const ProductCategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          "Categories",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.menu),
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 24,
        ),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 20,
              childAspectRatio: 0.95 / 1),
          itemBuilder: (context, index) {
            return ItemCategories(
              ontap: () {
                Navigator.pushNamed(
                    context, RouteName.productWithCategoriesName);
              },
              index: index,
            );
          },
        ),
      ),
    );
  }
}
