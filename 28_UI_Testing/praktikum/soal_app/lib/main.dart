import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/viewmodel/provider/contact_provider.dart';

import 'package:soal_app/view/screen/gallerypage.dart';
import 'package:soal_app/view/screen/create_contact.dart';
import 'package:soal_app/view/screen/homepage.dart';
import 'package:soal_app/view/screen/imagepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          '/contact': (_) => CreateContact(),
          '/gallery': (_) => GalleryPage(),
          '/image': (_) => ImagePage(
                imageUrl: '',
              ),
        },
      ),
    );
  }
}
