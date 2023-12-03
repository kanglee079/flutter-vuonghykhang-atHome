import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Movie {
  int id;
  String poster_path;
  String title;
  Movie({
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

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      poster_path: map['poster_path'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
