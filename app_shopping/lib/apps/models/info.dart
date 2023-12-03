import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Info {
  String id;
  String displayName;
  String photoUrl;
  String email;
  String? address;
  String? phone;
  Info({
    required this.id,
    required this.displayName,
    required this.photoUrl,
    required this.email,
    this.address,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) =>
      Info.fromMap(json.decode(source) as Map<String, dynamic>);
}
