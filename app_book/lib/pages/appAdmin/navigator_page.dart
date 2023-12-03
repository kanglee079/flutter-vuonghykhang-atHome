import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_book/pages/appAdmin/adminPage/admin_page.dart';
import 'package:app_book/pages/appAdmin/homePage/home_page.dart';
import 'package:app_book/pages/appAdmin/settingPage/setting_page.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: const <Widget>[
          HomePage(),
          AdminPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Theme.of(context).hintColor,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        icons: const [
          Icons.home,
          Icons.add_home_outlined,
          Icons.settings,
        ],
        activeColor: Theme.of(context).cardColor,
        iconSize: 30,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
