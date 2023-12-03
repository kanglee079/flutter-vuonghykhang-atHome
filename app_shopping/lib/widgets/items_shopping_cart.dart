import 'package:app_shopping/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemsShoppingCart extends StatefulWidget {
  int? id;
  String? image;
  String? name;
  int? price;
  int? quantity;
  ItemsShoppingCart({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  State<ItemsShoppingCart> createState() => _ItemsShoppingCartState();
}

class _ItemsShoppingCartState extends State<ItemsShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 115,
              child: ClipRRect(
                child: Image.network(
                  widget.image ?? "",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                Text(
                  '${NumberFormat('#,###', 'vi_VN').format(widget.price)}đ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                StatefulBuilder(
                  builder: (_, setState2) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .decrease(widget.id ?? 0);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "-",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widget.quantity.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .increase(widget.id ?? 0);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
          ),
        ],
      ),
    );
  }
}
