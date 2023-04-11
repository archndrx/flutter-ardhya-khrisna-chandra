part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageLoaded extends ImageState {
  final bool isFavorite;

  ImageLoaded(this.isFavorite);
}
