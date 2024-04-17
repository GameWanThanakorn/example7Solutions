import 'package:flutter/material.dart';

class BottomSheetLogic {
  final ScrollController scrollController = ScrollController();

  scrollToBottom(List<Map<String, dynamic>> fibList, Map<String, dynamic> map) {
    var itemHight = 41;
    scrollController.animateTo(
      fibList.indexOf(map).toDouble() * itemHight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  filterFibonacciList({required List<Map<String, dynamic>> fibList, required int calculateFib}) {
    return fibList.where((element) => element['value'] % 3 == calculateFib).toList();
  }

  sortFibonacciList({required List<Map<String, dynamic>> filterArray}) {
    return filterArray.sort((a, b) => a['value'].compareTo(b['value']));
  }

  firstWhereValue({required List<Map<String, dynamic>> filterArray, required int value}) {
    return filterArray.firstWhere((element) => element['value'] == value);
  }
}
