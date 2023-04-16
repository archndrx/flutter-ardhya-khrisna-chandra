import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_app/view/screen/gallerypage.dart';

void main() {
  testWidgets('create contact ...', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GalleryPage(),
      ),
    );
    final appBarFinder = find.byType(AppBar, skipOffstage: false);
    expect(appBarFinder, findsWidgets);
  });
}
