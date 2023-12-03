import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/provider/product_w_categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../apps/route/route_name.dart';
import '../../../widgets/items_with_categories.dart';
import '../../../widgets/search_product.dart';

class ProductsWithCategoriesPage extends StatelessWidget {
  int categoriesId;
  String nameCategories;
  ProductsWithCategoriesPage({
    super.key,
    required this.categoriesId,
    required this.nameCategories,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          nameCategories,
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
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.searchFiltersName);
            },
            icon: Icon(
              Icons.filter_alt,
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
              ontap: () {
                Navigator.pushNamed(context, RouteName.searchResultName);
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: context
                  .read<ProductWCategoriesProvider>()
                  .getProductWCategories(categoriesId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.flickr(
                        size: 100,
                        rightDotColor: Colors.amber,
                        leftDotColor: Colors.blue),
                  );
                }

                List<ProductModels> data = snapshot.data as List<ProductModels>;

                return ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 10, color: Colors.grey);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      child: ItemsWithCategories(
                        id: data[index].id,
                        name: data[index].name,
                        image: data[index].image,
                        price: data[index].price,
                        priceSaleOff: data[index].price_sale_off,
                        rating: data[index].rating,
                        ontap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.detailProductName,
                            arguments: ProductModels(
                              id: data[index].id,
                              name: data[index].name,
                              image: data[index].image,
                              price: data[index].price,
                              price_sale_off: data[index].price_sale_off,
                              rating: data[index].rating,
                              special: data[index].special,
                              summary: data[index].summary,
                              description: data[index].description,
                              isNew: data[index].isNew,
                              category_id: data[index].category_id,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
