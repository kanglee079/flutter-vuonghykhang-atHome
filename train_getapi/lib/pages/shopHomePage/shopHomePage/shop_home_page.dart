import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:train_getapi/apps/route/route_name.dart';

import '../../../widgets/intro_bar_shop_page.dart';
import '../../../widgets/items_categories.dart';
import '../../../widgets/items_popular.dart';
import '../../../widgets/search_product.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    const bool isLiked = false;
    final TextEditingController searchTextController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IntoBar(),
              GestureDetector(
                onTap: () {
                  print(123);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SearchProduct(
                    ontap: () {},
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://via.placeholder.com/288x188",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: 10,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Categories",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.categoriesName,
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 1.1 / 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: ItemCategories(
                                  ontap: () {
                                    Navigator.pushNamed(context,
                                        RouteName.productWithCategoriesName);
                                  },
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Deals",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.2 / 2,
                      ),
                      itemBuilder: (context, index) {
                        return ItemPopular(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.detailProductName);
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
