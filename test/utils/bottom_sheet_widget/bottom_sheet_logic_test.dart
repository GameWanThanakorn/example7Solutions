import 'package:flutter_application_1/utils/bottom_sheet_widget/bottom_sheet_logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BottomSheetLogic bottomSheetLogic;

  setUp(() {
    bottomSheetLogic = BottomSheetLogic();
  });
  group('BottomSheetLogic Tests', () {
    test('Test filterFibonacciList', () {
      final fibList = [
        {'index': 0, 'value': 0},
        {'index': 1, 'value': 1},
        {'index': 3, 'value': 2},
      ];
      final filteredList = bottomSheetLogic.filterFibonacciList(fibList: fibList, calculateFib: 0);
      expect(filteredList.every((element) => element['value'] % 3 == 0), true);
    });

    test('Test sortFibonacciList', () {
      final filterArray = [
        {'index': 4, 'value': 3},
        {'index': 1, 'value': 1},
        {'index': 3, 'value': 2},
      ];
      bottomSheetLogic.sortFibonacciList(filterArray: filterArray);
      expect(
          filterArray,
          equals([
            {'index': 1, 'value': 1},
            {'index': 3, 'value': 2},
            {'index': 4, 'value': 3},
          ]));
    });

    test('Test firstWhereValue', () {
      final filterArray = [
        {'index': 4, 'value': 3},
        {'index': 1, 'value': 1},
        {'index': 3, 'value': 2},
      ];
      final firstValue = bottomSheetLogic.firstWhereValue(filterArray: filterArray, value: 2);
      expect(firstValue, {'index': 3, 'value': 2});
    });
  });
}
