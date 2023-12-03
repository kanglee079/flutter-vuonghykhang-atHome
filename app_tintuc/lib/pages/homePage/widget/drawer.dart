import 'package:app_tintuc/apps/config/const.dart';
import 'package:app_tintuc/apps/route/route_name.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue.shade400,
              Colors.blue.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/imageDrawer.jpg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("App Tin Tức", style: styleTitleLg)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                "Trang Chủ",
                style: styleTitleItemActive,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                "Yêu Thích",
                style: styleTitleItemInActive,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                "Đã Xem",
                style: styleTitleItemInActive,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                "Setting",
                style: styleTitleItemInActive,
              ),
              onTap: () {
                Navigator.pushNamed(context, RouterName.settingName);
              },
            ),
            const ListTile(),
          ],
        ),
      ),
    );
  }
}
