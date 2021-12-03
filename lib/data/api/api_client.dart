import 'package:http/http.dart' as http;
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'dart:convert' as convert;

class ApiClient {
  static const baseUrl = "localhost:1337";
  static var client = ApiClient();
  var apiClient = http.Client();

  static ApiClient sharedInstance() {
    return client;
  }

  Future<List<Quote>?> getQuotes(int page, int per_page) async {
    var url = Uri.http(baseUrl, "quote/quotes",
        {'page': page.toString(), 'per_page': per_page.toString()});
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Quote.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  Future<List<Author>?> getAuthors() async {
    var url = Uri.http(
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
    return null;
  }

  Future<List<Category>?> getCategories() async {
    var url = Uri.http(
      baseUrl,
      "quote/authors",
    );
    var response = await apiClient.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((e) => Category.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
