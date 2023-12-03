import 'package:app_tintuc/apps/config/const.dart';
import 'package:app_tintuc/pages/homePage/widget/list_item.dart';
import 'package:app_tintuc/provider/category_provider.dart';
import 'package:app_tintuc/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<CategoryProvider>().getApiCategoryNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
          decoration: BoxDecoration(
            color: dColorMain,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu), // Icon tìm kiếm
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
            decoration: BoxDecoration(
              color: dColorMain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.search), // Icon tìm kiếm
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Consumer<SettingProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.listIdCategoryActive.length,
              itemBuilder: (context, index) {
                return ListItem(
                  idCategory: value.listIdCategoryActive[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
