import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  List<String> history = [];
  List<String> reversedHistory = [];
  String outputResult = "";

  String elResult(
      double numberOne, double numberTwo, double result, String operator) {
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

  // void changeResultToOne() {
  //   numberOne = result;
  //   notifyListeners();
  // }

  void performOperation(
      double numberOne, double numberTwo, double result, String operator) {
    switch (operator) {
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
    String calculatorHistory = elResult(numberOne, numberTwo, result, operator);
    outputResult = calculatorHistory;
    addToHistory(calculatorHistory);
    notifyListeners();
  }
}
