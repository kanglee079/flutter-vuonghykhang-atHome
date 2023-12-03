import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:like_image/model/item_model.dart';
import 'package:like_image/providers/item_provider.dart';
import 'package:provider/provider.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({super.key, required this.isFavorite});

  final isFavorite;

  @override
  Widget build(BuildContext context) {
    final dataItem = Provider.of<ItemProvider>(context);
    final items = isFavorite ? dataItem.showItemFavorite() : dataItem.items;

    return items.isNotEmpty
        ? Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: 350,
            itemHeight: 600,
            itemCount: items.length,
            itemBuilder: (BuildContext context, index) {
              return ChangeNotifierProvider.value(
                value: items[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.white12,
                      title: Consumer<Item>(
                        builder: (context, item, child) {
                          return InkWell(
                            onTap: (() {
                              item.toggleIsFavorite();
                              Provider.of<ItemProvider>(context, listen: false)
                                  .handleCountItem();
                            }),
                            child: Icon(
                              Icons.favorite,
                              color:
                                  item.isFavorite ? Colors.red : Colors.white,
                            ),
                          );
                        },
                      ),
                      subtitle: const Text('Like Image'),
                      trailing: Text(
                        items[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      items[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: const Center(
              child: Text('Not Image Like'),
            ),
          );
  }
}
