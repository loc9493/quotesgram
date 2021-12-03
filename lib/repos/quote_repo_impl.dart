import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/repos/quote_repo.dart';

class QuoteRepoImpl with QuoteRepo {
  @override
  Future<List<Author>> getAuthors() {
    // TODO: implement getAuthors
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<Quote>> getQuotes(int page, int per_page) {
    // TODO: implement getQuotes
    throw UnimplementedError();
  }

  @override
  Future<List<Quote>> getQuotesByAuthor(int page, int per_page, int authorID) {
    // TODO: implement getQuotesByAuthor
    throw UnimplementedError();
  }

  @override
  Future<List<Quote>> getQuotesByCategory(
      int page, int per_page, int categoryID) {
    // TODO: implement getQuotesByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Quote>> getQuotesBySearchTerm(
      int page, int per_page, String term) {
    // TODO: implement getQuotesBySearchTerm
    throw UnimplementedError();
  }
}
