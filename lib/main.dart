import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotesgram/repos/quote_repo_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async => {await QuoteRepoImpl().getQuotes(1, 10)},
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

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bestCats = ["Today", "Popular", "Recent"];
    return Container(
      height: 50,
      child: ListView.builder(
        itemCount: bestCats.length,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(bestCats[index], style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const arrColors = [Colors.red, Colors.green, Colors.yellow];
    return SizedBox.expand(
      child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.85,
          alignment: FractionalOffset.center,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 20,
                right: 20,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: arrColors[0],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                bottom: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: arrColors[1],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                bottom: 0,
                child: QuoteCard(),
              )
            ],
          )),
    );
  }
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
            fit: BoxFit.fitHeight,
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chúa thỉnh thoảng lại tạo nên điều kỳ diệu; Nhìn kìa, một luật sư, con người trung thực.\nGod works wonders now and then; Behold a lawyer, an honest man.",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            "- Benjamin Franklin",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 24,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    splashRadius: 5,
                    icon: Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    onPressed: () => {},
                    splashRadius: 5,
                    icon: Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
