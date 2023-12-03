import 'package:app_shopping/apps/models/favoriteItem.dart';
import 'package:app_shopping/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class ItemPopular extends StatefulWidget {
  int? id;
  String? name;
  int? price;
  String? image;
  int? rating;
  void Function()? onTap;
  ItemPopular({
    super.key,
    required this.onTap,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  State<ItemPopular> createState() => _ItemPopularState();
}

class _ItemPopularState extends State<ItemPopular> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            color: Theme.of(context).canvasColor),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        widget.image ?? "",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 5,
                    child: Consumer<FavoriteProvider>(
                      builder: (
                        BuildContext context,
                        FavoriteProvider value,
                        Widget? child,
                      ) {
                        bool isLike =
                            value.favorites.any((e) => e.id == widget.id);
                        return LikeButton(
                          onTap: addFavorite,
                          isLiked: isLike,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.name ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${NumberFormat('#,###', 'vi_VN').format(widget.price)}đ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        widget.rating.toString(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Provider.of<CartProvider>(context, listen: false).addCart(
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
                    child: Ink(
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).indicatorColor,
                        ),
                        child: Center(
                          child: Text(
                            "Add to cart",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
