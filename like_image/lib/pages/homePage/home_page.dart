import 'package:flutter/material.dart';

import 'package:like_image/providers/item_provider.dart';
import 'package:like_image/widget/body_swipe.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

enum fillterOption { all, favorite }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ItemProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade500,
                  Colors.amber.shade500,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: Consumer<ItemProvider>(
              builder: (context, item, child) {
                return badges.Badge(
                  badgeContent: Text(
                    item.countItemFavorite.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite,
                  ),
                );
              },
            ),
          ),
          title: const Text(
            'Favorite Images',
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == fillterOption.all) {
                    isFavorite = false;
                  } else {
                    isFavorite = true;
                  }
                });
              },
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: fillterOption.all,
                  child: Text('Show all'),
                ),
                const PopupMenuItem(
                  value: fillterOption.favorite,
                  child: Text('Show Favorite'),
                ),
                const PopupMenuItem(
                  child: Text('Setting'),
                ),
              ],
            ),
          ],
        ),
        body: SwipeBody(
          isFavorite: isFavorite,
        ));
  }
}
