import 'package:app_food/config/const.dart';
import 'package:app_food/pages/favoritePage/favorite_body.dart';
import 'package:app_food/pages/homePage/home_body.dart';
import 'package:app_food/pages/seenPage/seen_body.dart';
import 'package:flutter/material.dart';

class appFood extends StatefulWidget {
  static const routeName = "/";
  const appFood({super.key});

  @override
  State<appFood> createState() => _appFoodState();
}

class _appFoodState extends State<appFood> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    const FavoriteBody(),
    const SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        leading: const Icon(Icons.food_bank),
        title: const Text("App Food"),
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("My Account"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Settings"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Logout"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("My account menu is selected.");
            } else if (value == 1) {
              print("Settings menu is selected.");
            } else if (value == 2) {
              print("Logout menu is selected.");
            }
          }),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Seen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: dColorIconButtonActive,
        iconSize: sizeIconButton,
        unselectedItemColor: dColorIconButtonInactive,
        backgroundColor: dColorMain,
        onTap: _onItemTapped,
      ),
    );
  }
}
