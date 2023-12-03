import 'package:app_food/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/const.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber,
      ),
      width: double.infinity,
      height: 200,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: dColorFooterImage,
          title: Text(
            product.title,
            style: styleTitleItem,
            textAlign: TextAlign.center,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Product>(builder: (((context, value, child) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        value.toggleIsFavorite();
                      },
                      child: Icon(Icons.favorite,
                          color: value.isFavorite
                              ? dColorIconButtonActive
                              : Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(product.favorite, style: styleTextItem),
                  ],
                );
              }))),
              const SizedBox(width: 10),
              const Icon(Icons.timelapse),
              const SizedBox(width: 10),
              Text(product.view, style: styleTextItem),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
