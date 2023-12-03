import 'package:app_shopping/apps/models/favoriteItem.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FavoriteItem> _favorites = [];

  List<FavoriteItem> get favorites => _favorites;

  void addFavorite(FavoriteItem product) {
    _favorites.add(product);
    notifyListeners();
  }

  void removeFavorite(int productId) {
    FirebaseService().deleteFavorite(productId);
    _favorites.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  Future<void> saveFavoritesToFirebase() async {
    List<FavoriteItem> tempFavorites = List.from(_favorites);
    for (var product in tempFavorites) {
      await FirebaseService().addFavorite(product);
    }
  }

  Future<void> loadFavoritesFromFirebase() async {
    _favorites.clear();
    var loadedFavorites = await FirebaseService().getFavorites();
    _favorites.addAll(loadedFavorites);
    notifyListeners();
  }
}
