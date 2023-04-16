import 'package:flutter/material.dart';
import 'package:soal_app/model/images_model.dart';

class ImagePage extends StatelessWidget {
  final String imageUrl;

  const ImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final imageUrl =
        args != null && args is Map<String, String> ? args['imageUrl'] : null;

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
