import 'dart:convert';

import 'package:app_shopping/apps/models/product.dart';
import 'package:http/http.dart' as http;

class ProductPopularRepository {
  final String _baseUrl =
      'http://apiforlearning.zendvn.com/api/mobile/products?offset=0&sortBy=id&order=asc&special=true';

  Future<List<ProductModels>> fetchProductPopular() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => ProductModels.fromMap(model)).toList();
    } else {
      throw http.ClientException(
          'Failed to load sliders with status code: ${response.statusCode}');
    }
  }
}
