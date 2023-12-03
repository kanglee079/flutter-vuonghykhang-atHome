import 'package:app_food/config/const.dart';
import 'package:app_food/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductProvider>(context).getItemIsFavorite();

    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: ((direction) {
            items[index].handleRemoveFavorite();
          }),
          key: ValueKey<int>(index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 140,
              child: GridTile(
                footer: GridTileBar(
                  title: Text(
                    items[index].title,
                    style: styleTitleItem,
                  ),
                  trailing: const Icon(
                    Icons.swipe,
                    color: dColorIconButtonInactive,
                  ),
                  backgroundColor: dColorFooterImage,
                ),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        items[index].image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
