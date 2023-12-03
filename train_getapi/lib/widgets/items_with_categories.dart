import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemsWithCategories extends StatefulWidget {
  final Function()? ontap;
  const ItemsWithCategories({super.key, required this.ontap});

  @override
  State<ItemsWithCategories> createState() => _ItemsWithCategoriesState();
}

class _ItemsWithCategoriesState extends State<ItemsWithCategories> {
  bool isLiked = false;

  void handleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
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
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 32,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isLiked ? Colors.white : const Color(0xffff6464),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: handleLike,
                      child: Icon(
                        Icons.favorite,
                        color: isLiked ? const Color(0xffff6464) : Colors.white,
                        size: 28,
                      ),
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
                        "Fresh Tomatoes",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '\$5.0',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "\$8.0",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
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
