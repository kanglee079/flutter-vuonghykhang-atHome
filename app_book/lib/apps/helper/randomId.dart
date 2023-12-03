import 'dart:math';

String generateRandomId() {
  var rng = Random();
  var randomNumber = rng.nextInt(9000) + 1000;
  return randomNumber.toString();
}
