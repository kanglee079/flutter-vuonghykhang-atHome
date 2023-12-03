import 'package:app_food/config/const.dart';
import 'package:app_food/pages/homePage/widget/category.dart';
import 'package:app_food/providers/category_provider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final data = CategoryProvider().readJson();

  @override
  Widget build(BuildContext context) {
    print(data);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, CategoryPage.routeName,
                arguments: {"title": index});
          },
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "text alen dinaw moaine",
                    style: styleTitleItem,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
