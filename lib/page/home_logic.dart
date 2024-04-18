import 'package:flutter/material.dart';
import 'package:flutter_application_1/extension/icons_data.dart';

class HomeLogic {
  int a = 0, b = 1;
  List<int> sequence = [];
  List<Map<String, dynamic>> toggledIndexes = [];
  Map<String, dynamic> catchToggledIndexes = {};
  ScrollController scrollController = ScrollController();

  List<int> fibonacciSequence() {
    for (int i = 0; i < 41; i++) {
      sequence.add(a);
      int c = a + b;
      a = b;
      b = c;
    }
    return sequence;
  }

  bool containsIndex(int index) {
    return toggledIndexes.any((element) => element['index'] == index);
  }

  scrollToBottom(Map<String, dynamic> map) {
    var itemHight = 45;
    scrollController.animateTo(
      sequence.indexOf(map['value']).toDouble() * itemHight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void selected(Map<String, dynamic> map) {
    if (toggledIndexes.contains(map)) {
      catchToggledIndexes.addAll(map);
      remove(map);
    } else {
      add(map);
    }
  }

  add(Map<String, dynamic> map) {
    toggledIndexes.add(map);
  }

  remove(Map<String, dynamic> map) {
    toggledIndexes.remove(map);
  }

  Map<String, dynamic> firstWhereValue(int value) {
    return toggledIndexes.firstWhere((element) => element['value'] == value);
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
