import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quotesgram/models/author.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/models/wallpaper.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';
import 'package:quotesgram/utils/Constant.dart';

enum ViewMode { CardView, ListView }

class QuoteViewModel with ChangeNotifier {
  List<Quote> quotes = [];
  List<Author> authors = [];
  List<Category> categories = [];
  List<Wallpaper> wallpapers = [];
  Wallpaper? wallpaper;
  InterstitialAd? ad;
  ViewMode viewMode = ViewMode.ListView;
  int selectedTab = 0;
  int page = 1;
  int didTapQuoteDetail = 0;
  bool canLoadMore = true;
  Category? category;
  FilterItem filterItem = FilterItem.all;
  double wallpaperOpacity = 80;
  bool isLoading = false;
  TextStyle contentStyle = const TextStyle(fontSize: 25, color: Colors.white);
  TextStyle authorStyle = const TextStyle(fontSize: 18, color: Colors.white);
  TextAlign contentAlign = TextAlign.center;
  TextAlign authorAlign = TextAlign.center;
  setViewMode(ViewMode mode) {
    viewMode = mode;
    notifyListeners();
  }

  setWallpaperOpacity(double value) {
    wallpaperOpacity = value;
    notifyListeners();
  }

  setSelectedTab(int tabIndex) {
    selectedTab = tabIndex;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  setWallpaper(Wallpaper wallpaper) {
    this.wallpaper = wallpaper;
    notifyListeners();
  }

  setCountDidOpenQuoteDetail() {
    didTapQuoteDetail += 1;
    if (didTapQuoteDetail >= 5) {
      didTapQuoteDetail = 0;
    }
    print(didTapQuoteDetail);
    notifyListeners();
  }

  bool shouldOpenInterestialAd() {
    return didTapQuoteDetail == 0;
  }

  setFilterItem(FilterItem item) {
    filterItem = item;
    notifyListeners();
  }

  setContentStyle(TextStyle style) {
    contentStyle = contentStyle.merge(style);
    notifyListeners();
  }

  TextStyle getStyleForConfig(CardConfig config) {
    switch (config) {
      case CardConfig.AuthorText:
        return authorStyle;
      case CardConfig.ContentText:
        return contentStyle;
      default:
        return const TextStyle();
    }
  }

  TextAlign getAlignForConfig(CardConfig config) {
    switch (config) {
      case CardConfig.AuthorText:
        return authorAlign;
      case CardConfig.ContentText:
        return contentAlign;
      default:
        return TextAlign.center;
    }
  }

  Function? getUpdateStyleFunctionForConfig(CardConfig config) {
    switch (config) {
      case CardConfig.AuthorText:
        return setAuthorStyle;
      case CardConfig.ContentText:
        return setContentStyle;
      default:
    }
  }

  Function? getUpdateAlginFunctionForConfig(CardConfig config) {
    switch (config) {
      case CardConfig.AuthorText:
        return setAuthorAlign;
      case CardConfig.ContentText:
        return setContentAlign;
      default:
    }
  }

  setAuthorStyle(TextStyle style) {
    authorStyle = authorStyle.merge(style);
    notifyListeners();
  }

  setContentAlign(TextAlign align) {
    contentAlign = align;
    notifyListeners();
  }

  setAuthorAlign(TextAlign align) {
    authorAlign = align;
    notifyListeners();
  }

  getQuotes(int page, int per_page) async {
    setIsLoading(true);
    var result = await QuoteRepoImpl().getQuotes(page, per_page);
    if (result != null) {
      if (page == 1) {
        quotes.clear();
      }
      quotes.addAll(result);
      notifyListeners();
    }
    setIsLoading(false);
  }

  loadMore() {
    page = page + 1;
    getQuotes(page, 10);
  }

  bool shouldLoadMore() {
    return !isLoading;
  }

  getAuthors() async {
    var result = await QuoteRepoImpl().getAuthors();
    if (result != null) {
      authors = result;
      notifyListeners();
    }
  }

  getWallpapers() async {
    var result = await QuoteRepoImpl().getWallpapers();
    if (result != null) {
      wallpapers = result;
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
