import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/repository/product_w_categories_repo.dart';
import 'package:flutter/material.dart';

class ProductWCategoriesProvider extends ChangeNotifier {
  Future<List<ProductModels>> getProductWCategories(int categoriesId) async {
    List<ProductModels> data = await ProductWCategoriesRepository()
        .fetchProductWCategories(categoriesId);
    return data;
  }
}
