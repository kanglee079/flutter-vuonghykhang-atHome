import 'dart:convert';

import 'package:http/http.dart' as http;

import '../apps/models/sliders.dart';

class SliderRepository {
  final String _baseUrl = 'http://apiforlearning.zendvn.com/api/mobile/sliders';

  Future<List<SliderModels>> fetchSliders() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => SliderModels.fromMap(model)).toList();
    } else {
      throw http.ClientException(
          'Failed to load sliders with status code: ${response.statusCode}');
    }
  }
}
