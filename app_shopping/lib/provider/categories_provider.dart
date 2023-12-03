import 'package:app_shopping/apps/models/categories.dart';
import 'package:app_shopping/repository/categories_repo.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  Future<List<CategoriesModels>> getCategories() async {
    List<CategoriesModels> data =
        await CategoriesRepository().fetchCategories();
    return data;
  }
}
