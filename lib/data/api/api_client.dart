import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'dart:convert' as convert;

import 'package:quotesgram/models/wallpaper.dart';

class ApiClient {
  // static const baseUrl = "localhost:1337";
  // static const baseUrl = "quiet-earth-10140.herokuapp.com";
  static const baseUrl = "nhachutoan2018.kbvision.tv:6868";
  static var client = ApiClient();
  var apiClient = http.Client();

  static ApiClient sharedInstance() {
    return client;
  }

  Future<List<Quote>> readJsonQuotes() async {
    final String response = await rootBundle.loadString('assets/temp.json');
    var jsonResponse = convert.jsonDecode(response) as List<dynamic>;
    return jsonResponse.map((e) => Quote.fromJson(e)).toList();
  }

  Future<List<Quote>> getQuotes(int page, int per_page, int category) async {
    var url = Uri.https(baseUrl, "quote/quotes",
        {'page': page.toString(), 'per_page': per_page.toString()});
    if (category >= 0) {
      url = Uri.https(baseUrl, "quote/quotes", {
        'page': page.toString(),
        'per_page': per_page.toString(),
        'category': category.toString()
      });
    }
    print(url);
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Quote.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }

  Future<List<Wallpaper>> getWallpaper() async {
    var url = Uri.https(
      baseUrl,
      "wallpaper/wallpapers",
    );
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Wallpaper.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }

  // https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN

  Future<List<Author>> getAuthors() async {
    var url = Uri.https(
      baseUrl,
      "quote/authors",
    );
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Author.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }

  Future<List<Category>> getCategories() async {
    var url = Uri.https(
      baseUrl,
      "category/category",
    );
    print(url);
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Category.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }
}
