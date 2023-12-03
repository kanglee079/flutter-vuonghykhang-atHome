import 'package:app_food/config/const.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey<int>(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: GridTile(
                  footer: const GridTileBar(
                    title: Text(
                      "deserunt veritatis voluptatum",
                      style: styleTitleItem,
                    ),
                    trailing: Icon(
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
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
