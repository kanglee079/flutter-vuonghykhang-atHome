import 'package:app_shopping/apps/route/route_name.dart';
import 'package:app_shopping/provider/cart_provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../../apps/models/favoriteItem.dart';
import '../../../provider/favorite_provider.dart';
import '../../../widgets/button_custom.dart';

class ProductDetailPage extends StatefulWidget {
  int? id;
  String? name;
  String? image;
  int? price;
  int? price_sale_off;
  int? rating;
  bool? special;
  String? description;
  bool? isNew;
  int? categoryId;
  ProductDetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.price_sale_off,
    required this.rating,
    required this.special,
    required this.description,
    required this.isNew,
    required this.categoryId,
  });

  @override
  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  int _quanityItem = 0;

  void handleUpQuanity() {
    _quanityItem++;
  }

  void handleDownQuanity() {
    if (_quanityItem > 0) {
      _quanityItem--;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> addFavorite(bool isLiked) async {
      if (isLiked) {
        context.read<FavoriteProvider>().removeFavorite(widget.id ?? 0);
      } else {
        context.read<FavoriteProvider>().addFavorite(
              FavoriteItem(
                id: widget.id ?? 0,
                image: widget.image ?? "",
                name: widget.name ?? "",
                price: widget.price ?? 0,
                rating: widget.rating ?? 0,
              ),
            );
      }
      return !isLiked;
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      child: Image.network(
                        widget.image ?? "",
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                  itemCount: 4,
                  pagination: const SwiperPagination(),
                ),
              ),
              actions: [
                LikeButton(
                  onTap: addFavorite,
                ),
                const SizedBox(width: 10),
                Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Badge(
                      label: Text("${value.items.length}"),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteName.shoppingCartName);
                        },
                        icon: const Icon(Icons.shopping_cart),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 15),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.description ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow.shade800),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.rating ?? ""} (89 reviews)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            const Icon(Icons.local_shipping,
                                color: Colors.green),
                            const SizedBox(width: 5),
                            Text(
                              "FREE DELIVERY",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              '${NumberFormat('#,###', 'vi_VN').format(widget.price_sale_off)}đ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${NumberFormat('#,###', 'vi_VN').format(widget.price)}đ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState2) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        handleDownQuanity();
                                        setState2(() {});
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "$_quanityItem",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        handleUpQuanity();
                                        setState2(() {});
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        DottedLine(
                          dashColor: Theme.of(context).hintColor,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: Text(
                              "20% OFF DISCOUNT",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonCustom(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addCart(
                              widget.id ?? 0,
                              widget.image ?? '',
                              widget.name ?? '',
                              widget.price ?? 0,
                            );
                            Fluttertoast.showToast(
                                msg: "${widget.name} đã được thêm vào giỏ hàng",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Theme.of(context).cardColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          backgroundColor: Theme.of(context).cardColor,
                          textButton: "ADD TO CART",
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
