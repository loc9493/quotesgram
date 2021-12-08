import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/utils/Constant.dart';

import 'package:quotesgram/view_model/quote_view_model.dart';

class Filter {}

enum FilterItem { all, top_views, top_likes, saved }

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Top Views", "Top Likes", "Saved"];
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 5, right: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Constant.Persian),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Center(
                  child: Text(categories[index],
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
