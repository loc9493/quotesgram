import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context).categories;
    return GridView.builder(
      itemCount: vm.length,
      padding: EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Constant.ColorNeutural,
          padding: EdgeInsets.all(15),
          child: Text('${vm[index].name}'),
        );
      },
    );
  }
}
