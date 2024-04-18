import 'package:flutter_application_1/page/home_logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeLogic homeLogic;

  setUp(() {
    homeLogic = HomeLogic();
  });
  group('HomeLogic Tests', () {
    test('Test Fibonacci Sequence Generation', () {
      final sequence = homeLogic.fibonacciSequence();
      expect(sequence.length, equals(41));
      expect(sequence[0], equals(0));
      expect(sequence[3], equals(2));
      expect(sequence[40], equals(102334155));
    });

    test('Test Toggled Indexes', () {
      final map = {'index': 4, 'value': 3};
      homeLogic.toggledIndexes.add(map);
      expect(homeLogic.containsIndex(4), true);
      expect(homeLogic.firstWhereValue(3), map);
      homeLogic.toggledIndexes.remove(map);
      expect(homeLogic.containsIndex(4), false);
    });

    test('Test selected method when map is already toggled', () {
      final map = {'index': 2, 'value': 3};
      homeLogic.toggledIndexes.add(map);

      homeLogic.selected(map);

      expect(homeLogic.containsIndex(2), false);
      expect(homeLogic.catchToggledIndexes, equals(map));
    });

    test('Test selected method when map is not toggled', () {
      final map = {'index': 2, 'value': 3};

      homeLogic.selected(map);

      expect(homeLogic.containsIndex(2), true);
    });
  });
}
