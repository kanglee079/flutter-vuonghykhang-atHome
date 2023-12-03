import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_image/model/item_model.dart';
import 'package:provider/provider.dart';

class ItemProvider extends ChangeNotifier {
  // int _favorite = 0;

  // int get favorite => _favorite;

  // void updateFavorite() => {
  //       _favorite++,
  //       notifyListeners(),
  //     };

  List<Item> _items = [];
  int _countItemFavorite = 0;

  List<Item> get items {
    return [..._items];
  }

  int get countItemFavorite {
    return _countItemFavorite;
  }

  List<Item> showItemFavorite() {
    List<Item> data = _items.where((element) => element.isFavorite).toList();
    return data.isEmpty ? [] : data;
  }

  void handleCountItem() {
    _countItemFavorite = _items.where((element) => element.isFavorite).length;
    notifyListeners();
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/Json/items.json');
    final parsedList = await json.decode(response);
    List<Item> listData = List<Item>.from(
        parsedList.map((data) => Item.fromJson(jsonEncode(data))));
    _items = listData;
    notifyListeners();
  }
}
