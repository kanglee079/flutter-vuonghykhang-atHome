import 'package:flutter/material.dart';
import 'package:train_getapi/pages/shopHomePage/personalsPage/shop_personals_page.dart';
import 'package:train_getapi/pages/shopHomePage/shopHomePage/shop_home_page.dart';

import '../../widgets/icon_navigator_item.dart';

class ShopStatePage extends StatefulWidget {
  const ShopStatePage({super.key});

  @override
  State<ShopStatePage> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<ShopStatePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ShopHomePage(),
    ShopHomePage(),
    ShopHomePage(),
    ShopHomePage(),
    PersonalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).cardColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconNavigatorItem(
              icon: Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconNavigatorItem(
              icon: Icons.compare_arrows,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconNavigatorItem(
              icon: Icons.shopping_cart,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconNavigatorItem(
              icon: Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconNavigatorItem(
              icon: Icons.person_pin_outlined,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
