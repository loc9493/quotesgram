import 'package:flutter/material.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';

class CategoryViewModel extends ChangeNotifier {
  Category? category;
  List<Quote> quotes = [];
  int page = 1;
  setCategory(Category category) {
    this.category = category;
    print(category.id);
    getQuotes(1, 10);
    notifyListeners();
  }

  getQuotes(int page, int per_page) async {
    // setIsLoading(true);
    print(category);
    var result = await QuoteRepoImpl()
        .getQuotesByCategory(page, per_page, category?.id ?? -1);
    print('category');
    print(result);
    if (result != null) {
      if (page == 1) {
        quotes.clear();
      }
      quotes.addAll(result);
      notifyListeners();
    }
    // setIsLoading(false);
  }

  loadMore() {
    page = page + 1;
    getQuotes(page, 10);
  }
}
