import 'package:app_shopping/apps/models/product.dart';
import 'package:app_shopping/repository/product_detail_repo.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  Future<List<ProductModels>> getProductDetail(int productId) async {
    List<ProductModels> data =
        await ProductDetailRepository().fetchProductDetail(productId);

    return data;
  }
}
