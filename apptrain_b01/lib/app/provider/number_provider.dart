import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  int number = 10;

  void uncreNumber() {
    number++;
    notifyListeners();
  }

  void decreNumber() {
    number--;
    notifyListeners();
  }
}
