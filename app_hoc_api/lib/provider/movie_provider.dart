import 'package:app_hoc_api/models/movie_model.dart';
import 'package:app_hoc_api/responsitory/movie_repo.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  Future<List<Movie>> getMovieNowPlaying() async {
    List<Movie> data = await MovieRepo().getMovieApi();
    return data;
  }
}
