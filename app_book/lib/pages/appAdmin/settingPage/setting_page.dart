import 'package:app_book/manage/stores/user_store.dart';
import 'package:flutter/material.dart';

import '../../../widgets/item_admin_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mục quản trị",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Admin Name"),
          ItemAdminPage(
            nameItem: "Tài Khoản",
            ontap: () {},
          ),
          ItemAdminPage(
            nameItem: "Ngôn Ngữ",
            ontap: () {},
          ),
          ItemAdminPage(
            nameItem: "Theme",
            ontap: () {},
          ),
          ItemAdminPage(
            nameItem: "Đăng Xuất",
            ontap: () {
              UserStore.to.logout();
            },
          ),
        ],
      ),
    );
  }
}
