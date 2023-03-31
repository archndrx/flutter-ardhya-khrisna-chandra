part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class ToggleFavorite extends ImageEvent {
  final bool isFavorite;

  ToggleFavorite(this.isFavorite);
}
