import 'package:flutter/material.dart';
import 'package:flutter_application_1/extension/icons_data.dart';

class HomeLogic {
  int a = 0, b = 1;

  List<int> fibonacciSequence() {
    List<int> sequence = [];
    for (int i = 0; i < 41; i++) {
      sequence.add(a);
      int c = a + b;
      a = b;
      b = c;
    }
    return sequence;
  }

  IconData typeIcon(int n) {
    switch (n % 3) {
      case 0:
        return TypeFibonacci.circle.iconsData;
      case 1:
        return TypeFibonacci.square.iconsData;
      default:
        return TypeFibonacci.cross.iconsData;
    }
  }
}
