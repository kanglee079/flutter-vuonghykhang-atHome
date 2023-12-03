import 'package:app_shopping/apps/models/categories.dart';
import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/apps/models/sliders.dart';
import 'package:app_shopping/provider/categories_provider.dart';
import 'package:app_shopping/provider/product_popular_provider.dart';
import 'package:app_shopping/provider/slider_provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/intro_bar_shop_page.dart';
import '../../../widgets/items_categories.dart';
import '../../../widgets/items_popular.dart';
import '../../../widgets/search_product.dart';
import '../../apps/route/route_name.dart';

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
                    ontap: () {
                      Navigator.pushNamed(context, RouteName.searchResultName);
                    },
                  ),
                ),
              ),
              FutureBuilder(
                future: context.read<SliderProvider>().getSlider(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Center(
                        child: LoadingAnimationWidget.flickr(
                            size: 100,
                            rightDotColor: Colors.amber,
                            leftDotColor: Colors.blue),
                      ),
                    );
                  }
                  List<SliderModels> data = snapshot.data as List<SliderModels>;

                  return AspectRatio(
                    aspectRatio: 1 / 0.4,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Swiper(
                        autoplay: true,
                        autoplayDelay: 3000,
                        duration: 1000,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              data[index].image,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        itemCount: data.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                      ),
                    ),
                  );
                },
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
                        child: FutureBuilder(
                          future: context
                              .read<CategoriesProvider>()
                              .getCategories(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: LoadingAnimationWidget.flickr(
                                    size: 100,
                                    rightDotColor: Colors.amber,
                                    leftDotColor: Colors.blue),
                              );
                            }

                            List<CategoriesModels> data =
                                snapshot.data as List<CategoriesModels>;

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return AspectRatio(
                                  aspectRatio: 1.1 / 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: ItemCategories(
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
                                    ),
                                  ),
                                );
                              },
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
                    FutureBuilder(
                      future: context
                          .read<ProductPopularProvider>()
                          .getProductPopular(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: LoadingAnimationWidget.flickr(
                                size: 100,
                                rightDotColor: Colors.amber,
                                leftDotColor: Colors.blue),
                          );
                        }

                        List<ProductModels> data =
                            snapshot.data as List<ProductModels>;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.2 / 2,
                          ),
                          itemBuilder: (context, index) {
                            return ItemPopular(
                              id: data[index].id,
                              name: data[index].name,
                              price: data[index].price_sale_off,
                              image: data[index].image,
                              rating: data[index].rating,
                              onTap: () {
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
                            );
                          },
                        );
                      },
                    ),
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
