// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';
import 'package:quotesgram/data/api/api_client.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({required this.name, this.imageUrl, required this.id});
  int id;
  String name;
  String? imageUrl;

  String url() {
    return "http://${ApiClient.baseUrl}/$imageUrl";
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        id: json["id"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}
