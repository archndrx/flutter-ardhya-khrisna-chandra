import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:soal_app/model/api/food_api.dart';
import 'package:soal_app/viewmodel/provider/food_provider.dart';

import 'food_provider_test.mocks.dart';

@GenerateMocks([FoodProvider])
void main() {
  group('FoodProvider', () {
    test('fetch data return list food', () async {
      final mockFoodProvider = MockFoodProvider();
      await mockFoodProvider.fetchData();
      verify(mockFoodProvider.fetchData());
    });
  });
}
