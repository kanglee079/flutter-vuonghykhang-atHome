import 'dart:convert';

import 'package:app_food/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get item => [..._items];

  List<Product> getItemsWithCategoryId(categoryId) {
    return _items.where((element) => element.categoryId == categoryId).toList();
  }

  Product getItemWithId(id) {
    return _items.singleWhere((element) => element.id == id);
  }

  List<Product> getItemIsFavorite() {
    return _items.where((element) => element.isFavorite).toList();
  }

  Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final dataDecode = await json.decode(response);
    List<Product> data = List<Product>.from(
        dataDecode.map((i) => Product.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}
