import 'dart:convert';

import 'package:dio/dio.dart';

class ContactApi {
  final int id;
  final String name;

  final String phone;

  ContactApi({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory ContactApi.fromJson(Map<String, dynamic> json) {
    return ContactApi(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
