import 'package:flutter/material.dart';
import 'package:quotesgram/view/card_holder.dart';
import 'package:quotesgram/view/horizontal_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[HorizontalBar(), Expanded(child: CardHolder())],
    );
  }
}
