import 'package:app_shopping/apps/models/favoriteItem.dart';
import 'package:app_shopping/apps/models/info.dart';
import 'package:app_shopping/apps/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static String get userId => _auth.currentUser?.uid ?? '';

  static CollectionReference<Info> get infoRef =>
      _firestore.collection('info').withConverter<Info>(
            fromFirestore: (snapshot, _) => Info.fromMap(snapshot.data()!),
            toFirestore: (info, _) => info.toMap(),
          );

  static CollectionReference<Orders> get ordersRef => _firestore
      .collection('user')
      .doc(userId)
      .collection('orders')
      .withConverter<Orders>(
        fromFirestore: (snapshot, _) => Orders.fromMap(snapshot.data()!),
        toFirestore: (orders, _) => orders.toMap(),
      );

  static CollectionReference<FavoriteItem> get favoriteRef => _firestore
      .collection('user')
      .doc(userId)
      .collection('favorite')
      .withConverter<FavoriteItem>(
        fromFirestore: (snapshot, _) => FavoriteItem.fromMap(snapshot.data()!),
        toFirestore: (favoriteItem, _) => favoriteItem.toMap(),
      );

  Future<void> addFavorite(FavoriteItem product) async {
    await favoriteRef.doc(product.id.toString()).set(product);
  }

  Future<void> deleteFavorite(int productId) async {
    await favoriteRef.doc(productId.toString()).delete();
  }

  Future<List<FavoriteItem>> getFavorites() async {
    var snapshot = await favoriteRef.get();
    return snapshot.docs
        .map((doc) => FavoriteItem.fromMap(doc.data().toMap()))
        .toList();
  }

  Future<void> placeOrder(Orders order) async {
    ordersRef.doc(order.id).set(order);
  }
}
