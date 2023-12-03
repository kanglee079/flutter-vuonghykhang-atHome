import 'dart:async';

import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  int number = 60;
  bool isChange = false;
  Timer? timer;
  final StreamController<int> _streamController = StreamController<int>();

  Stream<int> get numberStream => _streamController.stream;

  void handClick() {
    isChange = !isChange;
    if (isChange) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (number < timer.tick) {
          timer.cancel();
        } else {
          _streamController.sink.add(number--);
        }
      });
    } else {
      timer!.cancel();
    }
    notifyListeners();
  }

  void handPause() {
    timer!.cancel();
  }

  handReset() {
    timer!.cancel();
    number = 60;
    _streamController.add(number);
  }

  @override
  void dispose() {
    _streamController.close();
    timer!.cancel();
    super.dispose();
  }
}
