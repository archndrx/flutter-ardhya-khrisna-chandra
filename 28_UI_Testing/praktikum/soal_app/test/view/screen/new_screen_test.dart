import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_app/view/screen/new_screen.dart';

void main() {
  group('MyNewPage', () {
    testWidgets('displays title correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NewScreen()));

      expect(find.text('My New Page'), findsOneWidget);
    });

    testWidgets('displays text correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NewScreen()));

      expect(find.text('Hello, World!'), findsOneWidget);
    });
  });
}
