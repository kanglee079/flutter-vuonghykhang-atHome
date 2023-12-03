import 'dart:convert';

import 'package:app_hoc_api/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepo {
  Future<List<Movie>> getMovieApi() async {
    try {
      const url =
          "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1";
      const token =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YWQ4Zjc4OWE4ZDFiOTE3MjkyNTUzMGFhNThlZjc0MyIsInN1YiI6IjY1MDdmOTA4M2NkMTJjMDE0ZWJmZDEyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dDEbbGneNX87biXflMjtXW9asAoEkhnGXn7zqouYKsE";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      Map body = jsonDecode(response.body);
      List data = body['results'];
      List<Movie> ListMovie = List<Movie>.from(
          data.map((e) => Movie.fromJson(jsonEncode(e))).toList());

      return ListMovie;
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
