import 'package:app_shopping/provider/cart_provider.dart';
import 'package:app_shopping/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemFavorite extends StatelessWidget {
  String id;
  String name;
  String image;
  int price;
  final Function()? ontap;
  ItemFavorite({
    super.key,
    required this.ontap,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 20),
          SlidableAction(
            onPressed: (context) {
              context.read<FavoriteProvider>().removeFavorite(int.parse(id));
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 115,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
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
                          name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '${NumberFormat('#,###', 'vi_VN').format(price)}đ',
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
                  InkWell(
                    onTap: () {
                      Provider.of<CartProvider>(context, listen: false).addCart(
                        int.parse(id),
                        image,
                        name,
                        price,
                      );
                      Fluttertoast.showToast(
                          msg: "$name đã được thêm vào giỏ hàng",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Theme.of(context).cardColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Ink(
                      child: Container(
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
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
