import 'package:flutter/material.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/view/bottom_bar.dart';
import 'package:quotesgram/view/quote_card.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key, required this.quote}) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: QuoteCard(quote: quote),
        ),
      ),
    );
  }
}
