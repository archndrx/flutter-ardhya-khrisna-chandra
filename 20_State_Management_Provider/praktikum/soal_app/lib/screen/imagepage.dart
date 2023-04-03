import 'package:flutter/material.dart';
import 'package:soal_app/model/images_model.dart';

class ImagePage extends StatelessWidget {
  final String imageUrl;

  const ImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final imageUrl = args['imageUrl'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Image"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/gallery');
            },
          ),
        ),
        body: Center(
          child: Image.asset(imageUrl!),
        ),
      ),
    );
  }
}
