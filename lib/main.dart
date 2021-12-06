import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';
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
            appBarTheme: AppBarTheme(color: Color(0xff000957)),
            scaffoldBackgroundColor: Color(0xff000957),
            iconTheme: IconThemeData(color: Colors.white),
            bottomAppBarTheme: BottomAppBarTheme(
              elevation: 10,
              color: Color(0xff000957),
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
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => {vm.getCategories()},
              icon: Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.person_outline),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.more_horiz_outlined),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Quotesgram', textAlign: TextAlign.center),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.menu_rounded)),
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
      body: Column(
        children: <Widget>[HorizontalBar(), Expanded(child: CardHolder())],
      ),
    );
  }
}
