import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeView renders correctly', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byType(HomeView), findsOneWidget);
  });
  testWidgets('HomeView displays expected number of index items', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle();

    expect(find.byKey(const Key("buildIndexItemWidget 0")), findsOneWidget);
    expect(find.byKey(const Key("buildIndexItemWidget 40")), findsNothing);
  });
  testWidgets('HomeView renders and scrolls to display the 12 index item', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle();

    expect(find.byKey(const Key("listViewScrollable")), findsOneWidget);
    await widgetTester.drag(find.byKey(const Key('listViewScrollable')), const Offset(0.0, -600));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("buildIndexItemWidget 12")), findsOneWidget);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  });
  testWidgets('HomeView renders and scrolls to display the 27 index item', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byKey(const Key("listViewScrollable")), findsOneWidget);
    await widgetTester.drag(find.byKey(const Key('listViewScrollable')), const Offset(0.0, -1000));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("buildIndexItemWidget 27")), findsOneWidget);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  });
  testWidgets('HomeView renders and scrolls to display the last index item', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byKey(const Key("listViewScrollable")), findsOneWidget);
    await widgetTester.drag(find.byKey(const Key('listViewScrollable')), const Offset(0.0, -1500));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("buildIndexItemWidget 40")), findsOneWidget);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  });
  testWidgets('HomeView: Tap on index item -> Highlight & Open BottomSheet', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    await widgetTester.tap(
      find.byKey(
        const Key('buildIndexItemWidget 0'),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    final colorsContainer = widgetTester.widget<Container>(find.byKey(const Key('container 0')));
    expect(colorsContainer.color, Colors.green);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("bottomSheet 0")), findsOneWidget);
    expect(find.byKey(const Key("bottomSheet 200")), findsNothing);
  });
  testWidgets(
    'HomeView: Tapping outside index item keeps it displayed',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HomeView(),
        ),
      );
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      await widgetTester.tap(
        find.byKey(
          const Key('buildIndexItemWidget 0'),
        ),
      );
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      final screenSize = widgetTester.getRect(find.byType(MaterialApp));
      final centerOffset = screenSize.topCenter;
      await widgetTester.tapAt(centerOffset);
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byKey(const Key("buildIndexItemWidget 0")), findsNothing);
    },
  );

  testWidgets('HomeView: Tap index item, tap bottom sheet button -> Remove & Maybe Highlight Item', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    await widgetTester.tap(
      find.byKey(
        const Key('buildIndexItemWidget 5'),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("bottomSheet 5")), findsOneWidget);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    await widgetTester.tap(
      find.byKey(
        const Key('bottomSheet 5'),
      ),
    );

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    final colorsContainer = widgetTester.widget<Container>(find.byKey(const Key('buildIndexItemWidget 5')));
    expect(colorsContainer.color, Colors.red);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key("buildIndexItemWidget 5")), findsOneWidget);
  });
}
