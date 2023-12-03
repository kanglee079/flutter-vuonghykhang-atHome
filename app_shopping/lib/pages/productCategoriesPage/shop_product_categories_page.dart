import 'package:app_shopping/provider/categories_provider.dart';
import 'package:app_shopping/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/items_categories.dart';
import '../../apps/models/categories.dart';
import '../../apps/route/route_name.dart';

class ProductCategoriesPage extends StatelessWidget {
  const ProductCategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Categories",
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.menu),
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Option 1',
                child: const Text('Option 1'),
                onTap: () {
                  Navigator.pushNamed(context, RouteName.shoppingCartName);
                },
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
        child: FutureBuilder(
          future: context.read<CategoriesProvider>().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.flickr(
                    size: 100,
                    rightDotColor: Colors.amber,
                    leftDotColor: Colors.blue),
              );
            }

            List<CategoriesModels> data =
                snapshot.data as List<CategoriesModels>;

            return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.95 / 1),
              itemBuilder: (context, index) {
                return ItemCategories(
                  name: data[index].name,
                  image: data[index].image,
                  id: data[index].id,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.productWithCategoriesName,
                      arguments: CategoriesModels(
                          id: data[index].id,
                          name: data[index].name,
                          image: data[index].image),
                    );
                  },
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
