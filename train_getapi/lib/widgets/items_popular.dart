import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ItemPopular extends StatefulWidget {
  void Function()? onTap;
  ItemPopular({
    super.key,
    required this.onTap,
  });

  @override
  State<ItemPopular> createState() => _ItemPopularState();
}

class _ItemPopularState extends State<ItemPopular> {
  bool _isLiked = false;
  int _quanityItem = 0;

  void handleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void handleUpQuanity() {
    _quanityItem++;
  }

  void handleDownQuanity() {
    _quanityItem--;
  }

  Widget _buildCartButton(Function(void Function()) setState2) {
    if (_quanityItem == 0) {
      return InkWell(
        onTap: () {
          handleUpQuanity();
          setState2(() {});
        },
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
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          Text(
            "$_quanityItem",
            style: Theme.of(context).textTheme.headlineMedium,
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "+",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(123);
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: LikeButton(),
                    // child: GestureDetector(
                    //   onTap: handleLike,
                    //   child: Icon(
                    //     _isLiked ? Icons.favorite : Icons.favorite_border,
                    //     color: _isLiked ? Colors.red : Colors.grey,
                    //     size: 30,
                    //   ),
                    // ),
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
                    "Name Foods",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "10.9",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        "(238)",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // _buildCartButton(),
                  StatefulBuilder(
                    builder: (_, setState2) {
                      return _buildCartButton(setState2);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
