// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
    required this.content,
  });

  String content;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
