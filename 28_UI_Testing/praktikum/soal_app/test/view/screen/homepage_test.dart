import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/view/screen/homepage.dart';
import 'package:soal_app/viewmodel/provider/contact_provider.dart';

void main() {
  testWidgets('home page harus ada kata Open Gallery',
      (WidgetTester tester) async {
    final provider = ContactProvider();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => provider,
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );
    expect(find.text('Open Gallery'), findsOneWidget);
  });
}
