import 'package:app_shopping/pages/myFavoritePage/shop_my_favorite_page.dart';
import 'package:app_shopping/pages/myOrdersPage/shop_my_orders_page.dart';
import 'package:app_shopping/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/icon_navigator_item.dart';
import 'personalsPage/shop_personals_page.dart';
import 'shopHomePage/shop_home_page.dart';
import 'shoppingCartPage/shop_cart_page.dart';

class ShopStatePage extends StatefulWidget {
  const ShopStatePage({super.key});

  @override
  State<ShopStatePage> createState() => _ShopStatePageState();
}

class _ShopStatePageState extends State<ShopStatePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const ShopHomePage(),
    const MyOrdersPage(),
    const ShoppingCartPage(),
    const MyFavoritePage(),
    const PersonalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
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
            icon: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Badge(
                  label: Text('${value.items.length}'),
                  child: IconNavigatorItem(
                    icon: Icons.shopping_cart,
                  ),
                );
              },
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
