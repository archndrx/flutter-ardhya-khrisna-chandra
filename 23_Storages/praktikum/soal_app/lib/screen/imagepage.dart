import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_app/bloc/image_bloc.dart';
import 'package:soal_app/model/images_model.dart';

class ImagePage extends StatefulWidget {
  final String imageUrl;

  const ImagePage({required this.imageUrl});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late ImageBloc _imageBloc;

  @override
  void initState() {
    _imageBloc = BlocProvider.of<ImageBloc>(context);
    super.initState();
  }

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
          actions: [
            BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoaded) {
                  return IconButton(
                    icon: Icon(state.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      _imageBloc.add(ToggleFavorite(!state.isFavorite));
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        body: Center(
          child: Image.asset(imageUrl!),
        ),
      ),
    );
  }
}
