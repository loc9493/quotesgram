// To parse this JSON data, do
//
//     final wallpaper = wallpaperFromJson(jsonString);

import 'dart:convert';

Wallpaper wallpaperFromJson(String str) => Wallpaper.fromJson(json.decode(str));

String wallpaperToJson(Wallpaper data) => json.encode(data.toJson());

class Wallpaper {
  Wallpaper({
    required this.startDate,
    required this.endDate,
    required this.url,
    required this.copyright,
    required this.copyrightLink,
  });

  String startDate;
  String endDate;
  String url;
  String copyright;
  String copyrightLink;

  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        startDate: json["start_date"],
        endDate: json["end_date"],
        url: json["url"],
        copyright: json["copyright"],
        copyrightLink: json["copyright_link"],
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "url": url,
        "copyright": copyright,
        "copyright_link": copyrightLink,
      };
}
