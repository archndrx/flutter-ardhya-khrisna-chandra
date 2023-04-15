import 'dart:convert';

class FoodApi {
  final int id;
  final String name;

  FoodApi({
    required this.id,
    required this.name,
  });

  factory FoodApi.fromJson(Map<String, dynamic> json) {
    return FoodApi(
      id: json['id'],
      name: json['name'],
    );
  }
}
