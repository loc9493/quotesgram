import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/category.dart';
import 'package:quotesgram/view/card_holder.dart';
import 'package:quotesgram/view/quote_list.dart';
import 'package:quotesgram/view_model/category_view_model.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: SafeArea(
        child: Container(
          child: QuoteList(),
        ),
      ),
    );
  }
}
