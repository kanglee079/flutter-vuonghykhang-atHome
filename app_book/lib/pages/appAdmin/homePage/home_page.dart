import 'package:flutter/material.dart';

import '../../../widgets/manager_status_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print("home");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trang Chính",
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
        children: [
          Expanded(
            flex: 1,
            child: ManagerStatusWidget(
              textNameStatus: "Quản lí người dùng",
              text1: "Người dùng hiện tại:",
              text2: "Người dùng mới trong ngày:",
              text3: "Tổng người dùng:",
              icon1: Icons.supervised_user_circle_outlined,
              icon2: Icons.person_add_alt,
              icon3: Icons.summarize_outlined,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: ManagerStatusWidget(
              textNameStatus: "Quản lí sách",
              text1: "Tổng số sách:",
              text2: "Tổng số thể loại:",
              text3: "Sách đã được đọc:",
              icon1: Icons.book_outlined,
              icon2: Icons.category_outlined,
              icon3: Icons.bookmarks_outlined,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
