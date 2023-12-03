import 'dart:convert';

class CategoriesModels {
  int id;
  String name;
  String image;
  CategoriesModels({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoriesModels.fromMap(Map<String, dynamic> map) {
    return CategoriesModels(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModels.fromJson(String source) =>
      CategoriesModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
