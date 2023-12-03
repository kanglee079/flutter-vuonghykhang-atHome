import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  double numberOne = 0;
  double numberTwo = 0;
  double result = 0;
  String operator = "";
  List<String> history = [];
  List<String> reversedHistory = [];

  String elResult() {
    String strNumberOne = numberOne == numberOne.floor()
        ? numberOne.toInt().toString()
        : numberOne.toDouble().toString();
    String strNumberTwo = numberTwo == numberTwo.floor()
        ? numberTwo.toInt().toString()
        : numberTwo.toDouble().toString();
    String strResult = result == result.floor()
        ? result.toInt().toString()
        : result.toDouble().toStringAsFixed(1);

    return '$strNumberOne $operator $strNumberTwo = $strResult';
  }

  void deleteAllHistory() {
    history.clear();
    reversedHistory.clear();
    notifyListeners();
  }

  void deleteHistory(index) {
    history.removeAt(index);
    reversedHistory.removeAt(index);
    notifyListeners();
  }

  void addToHistory(String v) {
    history.add(v);
    reversedHistory = List.from(history.reversed);
    notifyListeners();
  }

  void changeResultToOne() {
    numberOne = result;
    notifyListeners();
  }

  void performOperation(String newOperator) {
    operator = newOperator;
    switch (newOperator) {
      case "+":
        result = numberOne + numberTwo;
        break;
      case "-":
        result = numberOne - numberTwo;
        break;
      case "*" || "x":
        result = numberOne * numberTwo;
        break;
      case "/" || ":":
        result = numberOne / numberTwo;
        break;
      default:
        break;
    }
    String calculatorHistory = elResult();
    addToHistory(calculatorHistory);
    notifyListeners();
  }
}
