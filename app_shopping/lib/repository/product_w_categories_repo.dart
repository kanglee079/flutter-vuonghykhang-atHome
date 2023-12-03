import 'dart:convert';

import 'package:app_shopping/apps/models/product.dart';
import 'package:http/http.dart' as http;

class ProductWCategoriesRepository {
  final String _baseUrl =
      'http://apiforlearning.zendvn.com/api/mobile/categories/';

  Future<List<ProductModels>> fetchProductWCategories(int categoriesId) async {
    final String productWCategoriesUrl = "$_baseUrl$categoriesId/products";
    final response = await http.get(Uri.parse(productWCategoriesUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => ProductModels.fromMap(model)).toList();
    } else {
      throw http.ClientException(
          'Failed to load sliders with status code: ${response.statusCode}');
    }
  }
}
