import 'dart:convert';

class SliderModels {
  int id;
  String name;
  String image;
  SliderModels({
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

  factory SliderModels.fromMap(Map<String, dynamic> map) {
    return SliderModels(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderModels.fromJson(String source) =>
      SliderModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
