import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_app/view/screen/create_contact.dart';

void main() {
  testWidgets('create contact ...', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CreateContact(),
      ),
    );
    final nameField = find.byKey(Key('nameFieldKey'));
    expect(nameField, findsOneWidget);
  });
}
