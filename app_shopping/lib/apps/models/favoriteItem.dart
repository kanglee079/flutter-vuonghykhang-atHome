import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavoriteItem {
  int id;
  String image;
  String name;
  int price;
  int rating;
  FavoriteItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'rating': rating,
    };
  }

  factory FavoriteItem.fromMap(Map<String, dynamic> map) {
    return FavoriteItem(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as int,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteItem.fromJson(String source) =>
      FavoriteItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
