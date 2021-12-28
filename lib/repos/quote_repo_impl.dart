import 'package:quotesgram/data/api/api_client.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/wallpaper.dart';
import 'package:quotesgram/repos/quote_repo.dart';

class QuoteRepoImpl with QuoteRepo {
  @override
  Future<List<Author>> getAuthors() {
    // TODO: implement getAuthors
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategories() async {
    var result = await ApiClient.client.getCategories();
    return result;
  }

  @override
  Future<List<Quote>> getQuotes(int page, int per_page) async {
    var result = await ApiClient.client.getQuotes(page, per_page, -1);
    return result;
  }

  @override
  Future<List<Quote>> getQuotesByAuthor(int page, int per_page, int authorID) {
    // TODO: implement getQuotesByAuthor
    throw UnimplementedError();
  }

  @override
  Future<List<Quote>> getQuotesByCategory(
      int page, int per_page, int categoryID) async {
    var result = await ApiClient.client.getQuotes(page, per_page, categoryID);
    return result;
  }

  @override
  Future<List<Quote>> getQuotesBySearchTerm(
      int page, int per_page, String term) {
    // TODO: implement getQuotesBySearchTerm
    throw UnimplementedError();
  }

  @override
  Future<List<Wallpaper>> getWallpapers() async {
    var result = await ApiClient.client.getWallpaper();
    return result;
  }
}
