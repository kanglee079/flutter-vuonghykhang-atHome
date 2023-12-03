import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../apps/helper/randomIdString.dart';
import '../apps/models/order.dart';
import '../services/firebase_service.dart';

class CartItem {
  final int? id;
  final String? image;
  final String? name;
  final int? price;
  final int? quantity;

  CartItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier {
  Map<int, CartItem> items = {};

  void addCart(int productId, String image, String name, int price,
      [int quantity = 1]) {
    if (items.containsKey(productId)) {
      items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          image: value.image,
          name: value.name,
          price: value.price,
          quantity: value.quantity! + quantity,
        ),
      );
    } else {
      items.putIfAbsent(
          productId,
          () => CartItem(
                id: productId,
                image: image,
                name: name,
                price: price,
                quantity: quantity,
              ));
    }
    notifyListeners();
  }

  void increase(int productId, [int quantity = 1]) {
    items.update(
      productId,
      (value) => CartItem(
        id: value.id,
        image: value.image,
        name: value.name,
        price: value.price,
        quantity: value.quantity! + quantity,
      ),
    );
    notifyListeners();
  }

  void decrease(int productId, [int quantity = 1]) {
    if (items[productId]?.quantity == quantity) {
      items.removeWhere((key, value) => key == productId);
    } else {
      items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          image: value.image,
          name: value.name,
          price: value.price,
          quantity: value.quantity! - quantity,
        ),
      );
    }

    notifyListeners();
  }

  Orders getCartOrder(String userId) {
    List<OrderProduct> products = items.values.map(
      (cartItem) {
        return OrderProduct(
          productName: cartItem.name.toString(),
          productId: cartItem.id.toString(),
          productImage: cartItem.image.toString(),
          quantity: cartItem.quantity ?? 0,
          price: cartItem.price ?? 0,
        );
      },
    ).toList();

    return Orders(
      id: getRandomString(),
      userId: userId,
      products: products,
      orderDate: DateTime.now(),
    );
  }

  bool isCartEmpty() {
    return items.isEmpty;
  }

  void checkout(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    var order = cartProvider.getCartOrder(userId!);

    FirebaseService().placeOrder(order).then(
      (_) {
        Fluttertoast.showToast(
          msg: "Đặt hàng thành công!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).cardColor,
          textColor: Colors.white,
          fontSize: 20.0,
        );
        cartProvider.removeItems();
      },
    ).catchError(
      (error) {
        Fluttertoast.showToast(
          msg: "Có lỗi xảy ra: $error",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0,
        );
      },
    );

    notifyListeners();
  }

  void removeItems() {
    items.clear();
    notifyListeners();
  }
}
