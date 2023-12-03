import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Detail {
  int? id;
  String? title;
  String? description;
  String? content;
  String? thumb;
  String? publish_date;
  String? status;
  String? categoryId;
  Map? category;
  Detail({
    this.id,
    this.title,
    this.description,
    this.content,
    this.thumb,
    this.publish_date,
    this.status,
    this.categoryId,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'thumb': thumb,
      'publishDate': publish_date,
      'status': status,
      'categoryId': categoryId,
      'category': category,
    };
  }

  factory Detail.fromMap(Map<String, dynamic> map) {
    return Detail(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      thumb: map['thumb'] != null ? map['thumb'] as String : null,
      publish_date:
          map['publishDate'] != null ? map['publishDate'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      categoryId:
          map['categoryId'] != null ? map['categoryId'] as String : null,
      category: map['category'] != null ? map['category'] as Map : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Detail.fromJson(String source) =>
      Detail.fromMap(json.decode(source) as Map<String, dynamic>);
}
