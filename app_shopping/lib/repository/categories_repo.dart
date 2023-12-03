import 'dart:convert';

import 'package:app_shopping/apps/models/categories.dart';
import 'package:http/http.dart' as http;

class CategoriesRepository {
  final String _baseUrl =
      'http://apiforlearning.zendvn.com/api/mobile/categories';

  Future<List<CategoriesModels>> fetchCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => CategoriesModels.fromMap(model)).toList();
    } else {
      throw http.ClientException(
          'Failed to load sliders with status code: ${response.statusCode}');
    }
  }
}
