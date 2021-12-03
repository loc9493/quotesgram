// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  Author({
    required this.name,
  });

  String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
