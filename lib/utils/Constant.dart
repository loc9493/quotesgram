import 'package:flutter/material.dart';

enum CardConfig { Wallpaper, ContentText, AuthorText, Save, Share }
enum FilterItem { all, top_views, top_likes, saved }

class Constant {
  static const ColorPrimary = Color(0xff316B83);
  static const ColorHightLight = Burnt;
  static const ColorBackground = Charcoal;
  static const ColorNeutural = Color(0xff8CA1A5);
  static const ColorTitle = Color(0xff316B83);
  static const Charcoal = Color(0xff264653);
  static const Persian = Color(0xff2a9d8f);
  static const Crayola = Color(0xffe9c46a);
  static const Sandy = Color(0xfff4a261);
  static const Burnt = Color(0xffe76f51);

  static const CardConfigSize = 50.0;
  static const defaultWallpaperUrl =
      "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80";
  static const CardConfigs = [
    CardConfig.Wallpaper,
    CardConfig.ContentText,
    CardConfig.AuthorText,
  ];

  static const List<String> fonts = [
    'MangCau',
    'Sang Song',
    'Thay Giao Nhe',
    'Thoi Nay',
    'Thu Tu',
    'Tin Tuc',
  ];
  
  static const ColorsList = [
    Colors.transparent,
    Colors.white,
    Colors.black,
    Charcoal,
    Persian,
    Crayola,
    Sandy,
    Burnt
  ];
// {"Charcoal":"264653","Persian Green":"2a9d8f","Orange Yellow Crayola":"e9c46a","Sandy Brown":"f4a261","Burnt Sienna":"e76f51"}
  static String CardConfigTitle(CardConfig config) {
    switch (config) {
      case CardConfig.ContentText:
        return "Content Style";
      case CardConfig.AuthorText:
        return "Author Style";
      case CardConfig.Wallpaper:
        return "Wallpaper";
      case CardConfig.Save:
        return "Save";
      case CardConfig.Share:
        return "Share";
      default:
        return "Wallpaper";
    }
  }

  static Icon CardConfigIcon(CardConfig config) {
    switch (config) {
      case CardConfig.Wallpaper:
        return const Icon(
          Icons.image,
          size: CardConfigSize,
        );
      case CardConfig.AuthorText:
        return const Icon(
          Icons.text_fields,
          size: CardConfigSize,
        );
      case CardConfig.Save:
        return const Icon(
          Icons.save_alt_outlined,
          size: CardConfigSize,
        );
      case CardConfig.Share:
        return const Icon(
          Icons.share,
          size: CardConfigSize,
        );
      default:
        return const Icon(
          Icons.text_fields,
          size: CardConfigSize,
        );
    }
  }

  static filterTitle(FilterItem item) {
    switch (item) {
      case FilterItem.all:
        return "All";
      case FilterItem.top_likes:
        return "Top Likes";
      case FilterItem.top_views:
        return "Top Views";
      case FilterItem.saved:
        return "Saved";
      default:
        return "All";
    }
  }

  static const tabbar = [
    Icon(Icons.home_filled),
    Icon(Icons.grid_goldenratio_rounded),
    // Icon(Icons.search),
    // Icon(Icons.more_horiz),
  ];
}
