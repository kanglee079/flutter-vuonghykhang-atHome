import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:train_getapi/models/movie_models.dart';

class MovieRepo {
  Future<List<Movies>> getMovieApi(int page) async {
    try {
      final url =
          "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page";
      const token =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YWQ4Zjc4OWE4ZDFiOTE3MjkyNTUzMGFhNThlZjc0MyIsInN1YiI6IjY1MDdmOTA4M2NkMTJjMDE0ZWJmZDEyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dDEbbGneNX87biXflMjtXW9asAoEkhnGXn7zqouYKsE";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      Map body = jsonDecode(response.body);
      List data = body['results'];
      List<Movies> listMovies = List<Movies>.from(
          data.map((e) => Movies.fromJson(jsonEncode(e))).toList());

      return listMovies;
    } catch (e) {
      throw Error();
    }
  }

  Future<DetailMovies> getDetailApi(int movieId) async {
    try {
      final url = "https://api.themoviedb.org/3/movie/$movieId?language=en-US";
      const token =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YWQ4Zjc4OWE4ZDFiOTE3MjkyNTUzMGFhNThlZjc0MyIsInN1YiI6IjY1MDdmOTA4M2NkMTJjMDE0ZWJmZDEyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dDEbbGneNX87biXflMjtXW9asAoEkhnGXn7zqouYKsE";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        // Tạo một đối tượng DetailMovies từ Map
        DetailMovies detail = DetailMovies.fromMap(body);
        return detail;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Error();
    }
  }

  Future<List<SearchMovies>> searchMovie(String movieName) async {
    try {
      final url =
          "https://api.themoviedb.org/3/search/movie?query=${Uri.encodeComponent(movieName)}&include_adult=true&language=en-US&page=1";
      const token =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YWQ4Zjc4OWE4ZDFiOTE3MjkyNTUzMGFhNThlZjc0MyIsInN1YiI6IjY1MDdmOTA4M2NkMTJjMDE0ZWJmZDEyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dDEbbGneNX87biXflMjtXW9asAoEkhnGXn7zqouYKsE";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      Map body = jsonDecode(response.body);
      List data = body['results'];
      List<SearchMovies> listSearchMovie = List<SearchMovies>.from(
          data.map((e) => SearchMovies.fromJson(jsonEncode(e))).toList());

      return listSearchMovie;
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error during searchMovie: $e");
    }
  }
}
