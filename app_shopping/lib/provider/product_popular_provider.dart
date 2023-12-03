import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/repository/product_popular_repo.dart';
import 'package:flutter/material.dart';

class ProductPopularProvider extends ChangeNotifier {
  Future<List<ProductModels>> getProductPopular() async {
    List<ProductModels> data =
        await ProductPopularRepository().fetchProductPopular();

    return data;
  }
}
