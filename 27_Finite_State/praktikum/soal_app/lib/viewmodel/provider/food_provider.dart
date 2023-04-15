import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:soal_app/model/api/food_api.dart';

class FoodProvider with ChangeNotifier {
  List<FoodApi> _foods = [];

  Dio _dio = Dio(); // tambahkan properti _dio dan buat setter

  set dio(Dio dio) {
    _dio = dio;
  }

  List<FoodApi> get foods => [..._foods];

  Future<void> fetchData() async {
    final response = await _dio.get(// ubah Dio() menjadi _dio
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');
    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      _foods = data.map((e) => FoodApi.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
