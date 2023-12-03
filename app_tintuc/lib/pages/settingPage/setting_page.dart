import 'package:app_tintuc/apps/config/const.dart';
import 'package:app_tintuc/models/category.dart';
import 'package:app_tintuc/provider/category_provider.dart';
import 'package:app_tintuc/provider/setting_provider.dart';
import 'package:app_tintuc/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return Switch(
                value: value.switchTheme,
                onChanged: (s) {
                  value.changeTheme();
                },
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: FutureBuilder(
          future: context.read<CategoryProvider>().getApiCategoryNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) return Container();
            List<Category> data = snapshot.data as List<Category>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.8 / 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            data[index].name,
                            style: const TextStyle(color: dColorTitle),
                          ),
                        ),
                        Consumer<SettingProvider>(
                          builder: (context, value, child) {
                            return Checkbox(
                              shape: const CircleBorder(side: BorderSide.none),
                              value: value.listIdCategoryActive
                                  .contains(data[index].id),
                              onChanged: (_) {
                                value.activeCheck(data[index].id);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
