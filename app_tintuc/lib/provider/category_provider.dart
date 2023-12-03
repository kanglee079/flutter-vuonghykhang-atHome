import 'package:app_tintuc/models/category.dart';
import 'package:flutter/material.dart';

import '../repository/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getApiCategoryNews() async {
    List<Category> data = await CategoryRepository().getApiCategory();
    return data;
  }
}
