import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  String? id;
  String? nameCategory;
  Category({
    this.id,
    this.nameCategory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameCategory': nameCategory,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] != null ? map['id'] as String : null,
      nameCategory:
          map['nameCategory'] != null ? map['nameCategory'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
