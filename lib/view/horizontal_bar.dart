import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:quotesgram/view_model/quote_view_model.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<QuoteViewModel>(context).categories;
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(categories[index].name,
                style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
