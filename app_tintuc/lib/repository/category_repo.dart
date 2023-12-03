import 'dart:convert';

import 'package:app_tintuc/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<Category>> getApiCategory() async {
    try {
      const String url =
          'https://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc';
      final response = await http.get(Uri.parse(url));
      List data = jsonDecode(response.body);
      List<Category> result =
          List.from(data.map((e) => Category.fromJson(jsonEncode(e))).toList());
      return result;
    } catch (e) {
      print("Error fetching categories: $e");
      return [];
    }
  }
}
