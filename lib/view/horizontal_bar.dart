import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/utils/Constant.dart';

import 'package:quotesgram/view_model/quote_view_model.dart';

class Filter {}

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      FilterItem.all,
      FilterItem.top_likes,
      FilterItem.top_views,
      FilterItem.saved
    ];
    var current = Provider.of<QuoteViewModel>(context).filterItem;
    var vm = Provider.of<QuoteViewModel>(context);
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => vm.setFilterItem(categories[index]),
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 15),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: categories[index] == current
                        ? Constant.Burnt
                        : Constant.Persian),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Center(
                    child: Text(Constant.filterTitle(categories[index]),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
