import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  String? id;
  String? bookName;
  String? authorName;
  String? nameCategory;
  String? desc;
  String? photoUrl;
  String? pdfUrl;
  Book({
    this.id,
    this.bookName,
    this.authorName,
    this.nameCategory,
    this.desc,
    this.photoUrl,
    this.pdfUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bookName': bookName,
      'authorName': authorName,
      'nameCategory': nameCategory,
      'desc': desc,
      'photoUrl': photoUrl,
      'pdfUrl': pdfUrl,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] != null ? map['id'] as String : null,
      bookName: map['bookName'] != null ? map['bookName'] as String : null,
      authorName:
          map['authorName'] != null ? map['authorName'] as String : null,
      nameCategory:
          map['nameCategory'] != null ? map['nameCategory'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      pdfUrl: map['pdfUrl'] != null ? map['pdfUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
