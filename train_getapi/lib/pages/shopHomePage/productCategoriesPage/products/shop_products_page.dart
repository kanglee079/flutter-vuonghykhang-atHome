import 'package:flutter/material.dart';
import 'package:train_getapi/apps/route/route_name.dart';
import 'package:train_getapi/widgets/search_product.dart';

import '../../../../widgets/items_with_categories.dart';

class ProductsWithCategoriesPage extends StatelessWidget {
  const ProductsWithCategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          "Fruits",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
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
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.filter_list_alt,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
          ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
            child: SearchProduct(
              ontap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1.0, color: Colors.grey);
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  child: ItemsWithCategories(
                    ontap: () {
                      Navigator.pushNamed(context, RouteName.detailProductName);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
