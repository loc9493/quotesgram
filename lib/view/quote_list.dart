import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/screens/quote_screen.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view/quote_card.dart';
import 'package:quotesgram/view_model/category_view_model.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';
import 'package:tcard/tcard.dart';

class QuoteList extends StatelessWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListQuote();
  }
}

class ListQuote extends StatelessWidget {
  const ListQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<CategoryViewModel>(context);
    var quotes = Provider.of<CategoryViewModel>(context).quotes;
    final List<InkWell> quoteList = quotes
        .map((Quote quote) => InkWell(
              child: QuoteCell(quote: quote),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuoteScreen(quote: quote),
                  )),
            ))
        .toList();
    return LoadMore(
      isFinish: quotes.length > 500,
      onLoadMore: () async {
        vm.loadMore();
        return true;
      },
      child: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          var quote = quotes[index];
          return InkWell(
            child: QuoteCell(quote: quote),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuoteScreen(quote: quote),
                )),
          );
        },
      ),
    );
  }
}

class QuoteCell extends StatelessWidget {
  const QuoteCell({Key? key, required this.quote}) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: quote.id ?? 0,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              quote.content ?? "",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    quote.authorName(),
                    style: TextStyle(fontSize: 18),
                  ),
                  // Spacer(),
                  // IconButton(onPressed: () => {}, icon: Icon(Icons.share)),
                  // IconButton(
                  //     onPressed: () => {},
                  //     icon: Icon(Icons.favorite_border_outlined))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
