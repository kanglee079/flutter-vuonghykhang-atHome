import 'package:app_tintuc/apps/route/route_name.dart';
import 'package:app_tintuc/models/detail.dart';
import 'package:app_tintuc/pages/homePage/widget/detail_item.dart';
import 'package:app_tintuc/provider/detail_provider.dart';
import 'package:app_tintuc/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final int idCategory;

  const ListItem({Key? key, required this.idCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: context.read<DetailProvider>().getApiDetail(idCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) return Container();

            List<Detail> data = snapshot.data as List<Detail>;

            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data[0].category?["name"],
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.categoryName,
                            arguments: {
                              "idCategory": idCategory,
                              "nameCategory": data[0].category?["name"]
                            });
                      },
                      child: const Text(
                        "View All",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 20, color: Colors.white);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return AspectRatio(
                        aspectRatio: 3 / 0.85,
                        child: DetailItem(data: data[index]),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
