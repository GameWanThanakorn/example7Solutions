import 'package:flutter/material.dart';
import 'package:flutter_application_1/root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Myapp is a MaterialApp',
    (tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      expect(MyApp(), isA<MaterialApp>());
    },
  );
}
