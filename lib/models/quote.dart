// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({this.id, this.content, this.category, this.author, this.views = 0});

  int? id;
  int views;
  String? content;
  String? tacgia;
  String? theloai;
  Category? category;
  Author? author;

  String authorName() {
    if (author != null) {
      return author!.name;
    }
    return "";
  }

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        content: json["content"],
        id: json["id"],
        views: json["views"],
        category: Category.fromJson(json["category"]),
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "id": id,
        "category": category?.toJson(),
        "author": author?.toJson(),
      };
}
