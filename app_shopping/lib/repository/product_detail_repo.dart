import 'dart:convert';

import 'package:app_shopping/apps/models/product.dart';
import 'package:http/http.dart' as http;

class ProductDetailRepository {
  final String _baseUrl =
      "http://apiforlearning.zendvn.com/api/mobile/products/";

  Future<List<ProductModels>> fetchProductDetail(int productId) async {
    final String productDetailUrl = "$_baseUrl$productId";
    final response = await http.get(Uri.parse(productDetailUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => ProductModels.fromMap(model)).toList();
    } else {
      throw http.ClientException(
          'Failed to load sliders with status code: ${response.statusCode}');
    }
  }
}
