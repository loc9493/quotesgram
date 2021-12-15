// To parse this JSON data, do
//
//     final wallpaper = wallpaperFromJson(jsonString);

import 'dart:convert';

import 'package:quotesgram/data/api/api_client.dart';

Wallpaper wallpaperFromJson(String str) => Wallpaper.fromJson(json.decode(str));

String wallpaperToJson(Wallpaper data) => json.encode(data.toJson());

class Wallpaper {
  Wallpaper({
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.copyright,
    this.copyrightLink,
  });

  int createdAt;
  int updatedAt;
  String name;
  String? copyright;
  String? copyrightLink;

  String url() {
    return "http://${ApiClient.baseUrl}/$name";
  }

  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        name: json["name"],
        copyright: json["copyright"],
        copyrightLink: json["copyright_link"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "name": name,
        "copyright": copyright,
        "copyright_link": copyrightLink,
      };
}
