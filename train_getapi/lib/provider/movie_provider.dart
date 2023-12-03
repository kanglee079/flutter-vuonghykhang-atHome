import 'dart:async';

import 'package:flutter/material.dart';
import 'package:train_getapi/models/movie_models.dart';
import 'package:train_getapi/responsitory/movie_repo.dart';

class MovieProvider extends ChangeNotifier {
  final StreamController<List<Movies>> _movieController =
      StreamController<List<Movies>>.broadcast();

  final StreamController<List<SearchMovies>> _searchController =
      StreamController<List<SearchMovies>>.broadcast();

  List<Movies> listData = [];
  List<SearchMovies> listSearchData = [];

  Stream<List<Movies>> get streamMovie => _movieController.stream;
  Stream<List<SearchMovies>> get streamSearch => _searchController.stream;

  Future<void> getMovie(int page) async {
    if (page == 1) {
      List<Movies> data = await MovieRepo().getMovieApi(page);
      listData = data;
      _movieController.add(listData);
    } else {
      List<Movies> data = await MovieRepo().getMovieApi(page);
      listData.addAll(data);
      _movieController.add(listData);
    }
  }

  Future<void> searchMovies(String nameMovie) async {
    List<SearchMovies> dataSearchMovie =
        await MovieRepo().searchMovie(nameMovie);
    _searchController.add(dataSearchMovie);
  }

  Future<DetailMovies> getDetailMovie(int movieId) async {
    DetailMovies dataMovie = await MovieRepo().getDetailApi(movieId);
    return dataMovie;
  }

  @override
  void dispose() {
    _movieController.close();
    _searchController.close();
    super.dispose();
  }
}
