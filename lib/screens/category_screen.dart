import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/screens/category_detail.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view_model/category_view_model.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context).categories;
    var viewModel = Provider.of<CategoryViewModel>(context);
    return ListView.builder(
      itemCount: vm.length,
      // padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Container(
            height: 120,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: InkWell(
              onTap: () {
                viewModel.setCategory(vm[index]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetail(
                        category: vm[index],
                      ),
                    ));
              },
              child: Card(
                  color: Colors.transparent,
                  child: Stack(children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: vm[index].url(),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned.fill(
                        child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black87, Colors.black12])),
                    )),
                    Positioned.fill(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(padding: EdgeInsets.all(10)),
                        Text(
                          vm[index].name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 19),
                        ),
                      ],
                    ))
                  ])),
            ));
      },
    );
  }
}
