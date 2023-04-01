import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  bool isFavorite = false;

  ImageBloc() : super(ImageLoaded(false)) {
    on<ToggleFavorite>((event, emit) {
      isFavorite = event.isFavorite;
      emit(ImageLoaded(isFavorite));
    });
  }

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {}
}
