import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModels {
  int? id;
  String? name;
  String? image;
  int? price;
  int? price_sale_off;
  int? rating;
  bool? special;
  String? summary;
  String? description;
  bool? isNew;
  int? category_id;
  ProductModels({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.price_sale_off,
    required this.rating,
    required this.special,
    required this.summary,
    required this.description,
    required this.isNew,
    required this.category_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'price_sale_off': price_sale_off,
      'rating': rating,
      'special': special,
      'summary': summary,
      'description': description,
      'isNew': isNew,
      'categoryId': category_id,
    };
  }

  factory ProductModels.fromMap(Map<String, dynamic> map) {
    return ProductModels(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      price_sale_off:
          map['price_sale_off'] != null ? map['price_sale_off'] as int : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      special: map['special'] != null ? map['special'] as bool : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      isNew: map['isNew'] != null ? map['isNew'] as bool : null,
      category_id:
          map['category_id'] != null ? map['category_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModels.fromJson(String source) =>
      ProductModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
