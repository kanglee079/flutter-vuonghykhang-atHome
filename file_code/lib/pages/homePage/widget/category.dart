import 'package:flutter/material.dart';

import '../../../config/const.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final params = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(params["title"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Caterogy Page"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              width: double.infinity,
              height: 200,
              child: GridTile(
                footer: const GridTileBar(
                  backgroundColor: dColorFooterImage,
                  title: Text(
                    "eos aut dicta quae ea facere Dolorem omnis dolor dolorum omnis rerum quia velit.",
                    style: styleTitleItem,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 10),
                      Text("2123", style: styleTextItem),
                      SizedBox(width: 10),
                      Icon(Icons.timelapse),
                      SizedBox(width: 10),
                      Text("123", style: styleTextItem),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
