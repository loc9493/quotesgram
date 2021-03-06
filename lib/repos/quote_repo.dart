import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/wallpaper.dart';

abstract class QuoteRepo {
  Future<List<Quote>> getQuotes(int page, int per_page);
  Future<List<Quote>> getQuotesByCategory(
      int page, int per_page, int categoryID);
  Future<List<Quote>> getQuotesByAuthor(int page, int per_page, int authorID);
  Future<List<Quote>> getQuotesBySearchTerm(
      int page, int per_page, String term);
  Future<List<Author>> getAuthors();
  Future<List<Wallpaper>> getWallpapers();
  Future<List<Category>> getCategories();
}
