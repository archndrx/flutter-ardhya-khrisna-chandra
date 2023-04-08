import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AssetProvider extends ChangeNotifier {
  String imageUrl = '';

  Future<void> fetchImage(String text) async {
    try {
      final dio = Dio();
      final response = await dio
          .get('https://api.dicebear.com/6.x/pixel-art/svg?seed=$text');
      imageUrl = response.data.toString();
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
