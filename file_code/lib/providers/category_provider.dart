import 'dart:convert';

import 'package:app_food/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];

  List<Category> get item => [..._items];

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final dataDecode = await json.decode(response);
    List<Category> data = List<Category>.from(
        dataDecode.map((i) => Category.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}
