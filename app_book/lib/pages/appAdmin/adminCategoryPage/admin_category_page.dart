import 'package:app_book/apps/route/route_name.dart';
import 'package:app_book/widgets/search_book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../manage/services/firebase_service.dart';
import '../../../widgets/item_category.dart';

class AdminCategoryPage extends StatelessWidget {
  const AdminCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Thể Loại",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBook(
                  contentSearch: "Search Your Category",
                  icon: Icons.search,
                ),
                const SizedBox(height: 15),
                Text(
                  "Danh sách thể loại",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                StreamBuilder<List<String>>(
                  stream: FirebaseService.getAllCategories(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Chưa kết nối.');
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          List<String> categories = snapshot.data!;
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                  height: 15, color: Colors.white);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ItemCategory(
                                index: index,
                                nameCategory: categories[index],
                              );
                            },
                          );
                        } else {
                          return const Text('Không có dữ liệu.');
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RouterName.addCaterogy);
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
