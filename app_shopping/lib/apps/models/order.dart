import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderProduct {
  String? productId;
  String? productName;
  String? productImage;
  int? quantity;
  int? price;
  OrderProduct({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productId': productId,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderProduct.fromMap(Map<String, dynamic> map) {
    return OrderProduct(
      productName:
          map['productName'] != null ? map['productName'] as String : "",
      productId: map['productId'] != null ? map['productId'] as String : "",
      productImage:
          map['productImage'] != null ? map['productImage'] as String : "",
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      price: map['price'] != null ? map['price'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProduct.fromJson(String source) =>
      OrderProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Orders {
  String id;
  String userId;
  List<OrderProduct> products;
  DateTime orderDate;
  Orders({
    required this.id,
    required this.userId,
    required this.products,
    required this.orderDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'userId': userId,
      'products': products.map((x) => x.toMap()).toList(),
      'orderDate': orderDate.millisecondsSinceEpoch,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      id: map["id"] as String,
      userId: map['userId'] as String,
      products: (map['products'] as List<dynamic>)
          .map<OrderProduct>(
              (x) => OrderProduct.fromMap(x as Map<String, dynamic>))
          .toList(),
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);
}
