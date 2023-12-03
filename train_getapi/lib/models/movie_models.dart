import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movies {
  int id;
  String poster_path;
  String title;
  Movies({
    required this.id,
    required this.poster_path,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'poster_path': poster_path,
      'title': title,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      id: map['id'] as int,
      poster_path: map['poster_path'] ?? "",
      title: map['title'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) =>
      Movies.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DetailMovies {
  int id;
  String backdrop_path;
  String overview;
  String original_title;
  DetailMovies({
    required this.id,
    required this.backdrop_path,
    required this.overview,
    required this.original_title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'backdrop_path': backdrop_path,
      'overview': overview,
      'original_title': original_title,
    };
  }

  factory DetailMovies.fromMap(Map<String, dynamic> map) {
    return DetailMovies(
      id: map['id'] as int,
      backdrop_path: map['backdrop_path'] ?? "",
      overview: map['overview'] ?? "",
      original_title: map['original_title'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailMovies.fromJson(String source) =>
      DetailMovies.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SearchMovies {
  int id;
  String title;
  String overview;
  String poster_path;
  SearchMovies({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': poster_path,
    };
  }

  factory SearchMovies.fromMap(Map<String, dynamic> map) {
    return SearchMovies(
      id: map['id'] as int,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      poster_path: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchMovies.fromJson(String source) =>
      SearchMovies.fromMap(json.decode(source) as Map<String, dynamic>);
}
