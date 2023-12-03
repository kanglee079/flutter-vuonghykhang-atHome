import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../apps/models/favoriteItem.dart';
import '../provider/favorite_provider.dart';

class ItemsWithCategories extends StatelessWidget {
  int? id;
  String? name;
  String? image;
  int? price;
  int? priceSaleOff;
  int? rating;

  final Function()? ontap;
  ItemsWithCategories({
    super.key,
    required this.ontap,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.priceSaleOff,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    Future<bool?> addFavorite(bool isLiked) async {
      if (isLiked) {
        context.read<FavoriteProvider>().removeFavorite(id ?? 0);
      } else {
        context.read<FavoriteProvider>().addFavorite(
              FavoriteItem(
                id: id ?? 0,
                image: image ?? "",
                name: name ?? "",
                price: price ?? 0,
                rating: rating ?? 0,
              ),
            );
      }
      return !isLiked;
    }

    return GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Image.network(
                    image ??
                        "https://plus.unsplash.com/premium_photo-1665657351427-efdfbf01fb81?q=80&w=3280&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 32,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Consumer<FavoriteProvider>(
                      builder: (BuildContext context, FavoriteProvider value,
                          Widget? child) {
                        bool isLike = value.favorites.any((e) => e.id == id);
                        return LikeButton(
                          size: 28,
                          onTap: addFavorite,
                          isLiked: isLike,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "Default",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${NumberFormat('#,###', 'vi_VN').format(price)}đ',
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '${NumberFormat('#,###', 'vi_VN').format(priceSaleOff)}đ',
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.tag,
                            color: Theme.of(context).highlightColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Disc. 10%Off",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
