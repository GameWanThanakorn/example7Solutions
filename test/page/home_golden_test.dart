import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('first Index', () {
    testGoldens('HomeView golden test: Page transitions and appearance First Index', (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          name: 'page 1',
          widget: const HomeView(),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );
            expect(finder, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 2',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );
            expect(finder, findsOneWidget);
            await tester.tap(finder);
          },
        )
        ..addScenario(
          name: 'page 3',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );

            expect(finder, findsOneWidget);

            await tester.tap(finder);

            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("bottomSheet 0")),
            );
            final finder3 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("container 0")),
            );
            final colorsContainer = tester.widget<Container>(finder3);
            expect(colorsContainer.color, Colors.green);
            expect(finder2, findsOneWidget);

            final topPosition = tester.getTopLeft(finder2);

            await tester.tapAt(topPosition);

            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder4 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );
            expect(finder4, findsNothing);
          },
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'home_view_not_back_to_first_index');
    });
    testGoldens('HomeView golden test: Page transitions and appearance bottom First Index', (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          name: 'page 1',
          widget: const HomeView(),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );
            expect(finder, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 2',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );
            expect(finder, findsOneWidget);
            await tester.tap(finder);
          },
        )
        ..addScenario(
          name: 'page 3',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );

            expect(finder, findsOneWidget);

            await tester.tap(finder);

            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("bottomSheet 0")),
            );
            final finder3 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("container 0")),
            );
            final colorsContainer = tester.widget<Container>(finder3);
            expect(colorsContainer.color, Colors.green);
            expect(finder2, findsOneWidget);
            await tester.tap(finder2);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder4 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 0")),
            );

            expect(finder4, findsOneWidget);
            final colorsItem = tester.widget<Container>(finder4);
            expect(colorsItem.color, Colors.red);
            await tester.pumpAndSettle(const Duration(seconds: 2));
          },
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'home_view_back_to_first_index');
    });
  });
  group('last Index', () {
    testGoldens('HomeView golden test: Page transitions and appearance last Index', (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          name: 'page 1',
          widget: const HomeView(),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 15")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 2',
          widget: const HomeView(),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1000));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 27")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 3',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 4));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1400));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 4',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
            await tester.tap(finder2);
            await tester.pumpAndSettle(const Duration(seconds: 2));
          },
        )
        ..addScenario(
          name: 'page 5',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
            await tester.tap(finder2);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder3 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("bottomSheet 102334155")),
            );
            final finder4 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("container 102334155")),
            );
            final colorsContainer = tester.widget<Container>(finder4);
            expect(finder3, findsOneWidget);
            expect(colorsContainer.color, Colors.green);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final topPosition = tester.getTopLeft(finder3);

            await tester.tapAt(topPosition);

            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder5 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );
            expect(finder5, findsNothing);
          },
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'home_view_not_back_to_last_index');
    });
    testGoldens('HomeView golden test: Page transitions and appearance bottom First Index', (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          name: 'page 1',
          widget: const HomeView(),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 15")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 2',
          widget: const HomeView(),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1000));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 27")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 3',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            await tester.pumpAndSettle(const Duration(seconds: 4));
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1400));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
          },
        )
        ..addScenario(
          name: 'page 4',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
            await tester.tap(finder2);
            await tester.pumpAndSettle(const Duration(seconds: 2));
          },
        )
        ..addScenario(
          name: 'page 5',
          widget: const MaterialApp(
            home: HomeView(),
          ),
          onCreate: (key) async {
            final finder = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("listViewScrollable")),
            );
            expect(finder, findsOneWidget);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.drag(finder, const Offset(0.0, -1600));
            await tester.pumpAndSettle(const Duration(seconds: 2));

            final finder2 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder2, findsOneWidget);
            await tester.tap(finder2);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder3 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("bottomSheet 102334155")),
            );
            final finder4 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("container 102334155")),
            );
            final colorsContainer = tester.widget<Container>(finder4);
            expect(finder3, findsOneWidget);
            expect(colorsContainer.color, Colors.green);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await tester.tap(finder3);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            final finder5 = find.descendant(
              of: find.byKey(key),
              matching: find.byKey(const Key("buildIndexItemWidget 40")),
            );

            expect(finder5, findsOneWidget);
            final colorsItem = tester.widget<Container>(finder5);
            expect(colorsItem.color, Colors.red);
            await tester.pumpAndSettle(const Duration(seconds: 2));
          },
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'home_view_back_to_last_index');
    });
  });
}
