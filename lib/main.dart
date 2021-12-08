import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';
import 'package:quotesgram/screens/category_screen.dart';
import 'package:quotesgram/screens/home_screen.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view/bottom_bar.dart';
import 'package:quotesgram/view/card_holder.dart';
import 'package:quotesgram/view/horizontal_bar.dart';
import 'package:quotesgram/view/quote_card.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Constant.ColorBackground),
            scaffoldBackgroundColor: Constant.ColorBackground,
            iconTheme: IconThemeData(color: Colors.white),
            bottomAppBarTheme: BottomAppBarTheme(
              elevation: 10,
              color: Constant.ColorBackground,
            )),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var vm = Provider.of<QuoteViewModel>(context, listen: false);
      vm.getCategories();
      vm.getQuotes(1, 20);
    });
  }

  final List screens = [
    HomeScreen(),
    CategoryScreen(),
    CategoryScreen(),
    CategoryScreen(),
    CategoryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context);
    // vm.getCategories();
    // vm.getQuotes(1, 20);
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Quotesgram', textAlign: TextAlign.center),
        actions: [
          IconButton(
              color: vm.viewMode == ViewMode.ListView
                  ? Constant.ColorHightLight
                  : Colors.white,
              onPressed: () => {vm.setViewMode(ViewMode.ListView)},
              icon: const Icon(Icons.menu_rounded)),
          IconButton(
              color: vm.viewMode == ViewMode.CardView
                  ? Constant.ColorHightLight
                  : Colors.white,
              onPressed: () => {vm.setViewMode(ViewMode.CardView)},
              icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
      body: screens[vm.selectedTab],
    );
  }
}
