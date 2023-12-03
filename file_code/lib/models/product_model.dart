import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String categoryId;
  String title;
  String image;
  String intro;
  String ingredients;
  String instructions;
  String view;
  String favorite;
  Product({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.image,
    required this.intro,
    required this.ingredients,
    required this.instructions,
    required this.view,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'image': image,
      'intro': intro,
      'ingredients': ingredients,
      'instructions': instructions,
      'view': view,
      'favorite': favorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      intro: map['intro'] as String,
      ingredients: map['ingredients'] as String,
      instructions: map['instructions'] as String,
      view: map['view'] as String,
      favorite: map['favorite'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

