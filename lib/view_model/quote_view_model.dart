import 'package:flutter/material.dart';
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';

enum ViewMode { CardView, ListView }

class QuoteViewModel with ChangeNotifier {
  List<Quote> quotes = [];
  List<Author> authors = [];
  List<Category> categories = [];
  ViewMode viewMode = ViewMode.ListView;
  int selectedTab = 0;
  setViewMode(ViewMode mode) {
    viewMode = mode;
    notifyListeners();
  }

  setSelectedTab(int tabIndex) {
    selectedTab = tabIndex;
    notifyListeners();
  }

  getQuotes(int page, int per_page) async {
    var result = await QuoteRepoImpl().getQuotes(page, per_page);
    if (result != null) {
      quotes = result;
      notifyListeners();
    }
  }

  getAuthors() async {
    var result = await QuoteRepoImpl().getAuthors();
    if (result != null) {
      authors = result;
      notifyListeners();
    }
  }

  getCategories() async {
    var result = await QuoteRepoImpl().getCategories();
    if (result != null) {
      categories = result;
      notifyListeners();
    }
  }
}
