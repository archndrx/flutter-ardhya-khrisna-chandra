import 'package:flutter/material.dart';
import 'package:soal_app/screen/gallerypage.dart';
import 'package:soal_app/screen/homepage.dart';
import 'package:soal_app/screen/imagepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/gallery': (_) => GalleryPage(),
        '/image': (_) => ImagePage(
              imageUrl: '',
            ),
      },
    );
  }
}
