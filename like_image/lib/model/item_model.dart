import 'dart:convert';

import 'package:flutter/cupertino.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item extends ChangeNotifier {
  String id;
  String name;
  String image;
  bool isFavorite = false;

  Item({
    required this.id,
    required this.name,
    required this.image,
  });

  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
