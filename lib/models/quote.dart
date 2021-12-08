// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
    this.id,
    this.content,
    this.category,
    this.author,
  });

  int? id;
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
        category: Category.fromJson(json["category"]),
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "category": category?.toJson(),
        "author": author?.toJson(),
      };
}
