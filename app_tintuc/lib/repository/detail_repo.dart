import 'dart:convert';

import 'package:app_tintuc/models/detail.dart';
import 'package:http/http.dart' as http;

class DetailRepository {
  Future<List<Detail>> getApiDetail(int id, {int limit = 4}) async {
    try {
      String url =
          'https://apiforlearning.zendvn.com/api/categories_news/$id/articles?limit=$limit&page=1';
      final response = await http.get(Uri.parse(url));
      List data = jsonDecode(response.body);
      List<Detail> result =
          List.from(data.map((e) => Detail.fromJson(jsonEncode(e))).toList());
      return result;
    } catch (e) {
      print("Error fetching categories: $e");
      return [];
    }
  }
}
