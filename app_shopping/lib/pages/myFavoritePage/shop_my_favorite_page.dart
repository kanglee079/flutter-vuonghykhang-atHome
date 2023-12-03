import 'package:app_shopping/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/items_favorite.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({super.key});

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  @override
  void initState() {
    context.read<FavoriteProvider>().loadFavoritesFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "My Favorite",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Icon(
              Icons.search,
              color: Theme.of(context).hintColor,
              size: 30,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<FavoriteProvider>(
          builder:
              (BuildContext context, FavoriteProvider value, Widget? child) {
            return ListView.separated(
              itemCount: value.favorites.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 20, color: Colors.grey);
              },
              itemBuilder: (BuildContext context, int index) {
                final items = value.favorites[index];
                return ItemFavorite(
                  ontap: () {},
                  id: items.id.toString(),
                  name: items.name,
                  image: items.image,
                  price: items.price,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
