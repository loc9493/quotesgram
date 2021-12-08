import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/screens/quote_screen.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view/quote_card.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';
import 'package:tcard/tcard.dart';

class CardHolder extends StatelessWidget {
  const CardHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context).quotes;
    var quoteVM = Provider.of<QuoteViewModel>(context);
    var viewMode = Provider.of<QuoteViewModel>(context).viewMode;
    final List<Widget> cards = List.generate(
      vm.length,
      (index) => Container(
        color: Colors.blue,
        child: Center(
          child: QuoteCard(
            quote: vm[index],
          ),
        ),
      ),
    );
    const arrColors = [Colors.red, Colors.green, Colors.yellow];
    return viewMode == ViewMode.CardView
        ? cardView(vm, cards)
        : listView(quoteVM, cards);
  }

  Future<bool> _loadMore(QuoteViewModel vm) async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    vm.getQuotes(2, 20);
    return true;
  }

  SizedBox listView(QuoteViewModel viewModel, List<Widget> cards) {
    var vm = viewModel.quotes;
    return SizedBox.expand(
        child: LoadMore(
      isFinish: vm.length >= 1000,
      onLoadMore: () => _loadMore(viewModel),
      child: ListView.builder(
          itemCount: vm.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuoteScreen(
                                quote: vm[index],
                              )))
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: Stack(overflow: Overflow.visible, children: [
                          Column(
                            children: [
                              Text(vm[index].content ?? "",
                                  style: TextStyle(fontSize: 22)),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Text(vm[index].authorName(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: -20,
                              right: -10,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () => {print("Run")},
                                    splashRadius: 5,
                                    color: Constant.Sandy,
                                    icon: Icon(Icons.share_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () => {},
                                    splashRadius: 5,
                                    color: Constant.Sandy,
                                    icon: Icon(Icons.favorite_border_rounded),
                                  )
                                ],
                              ))
                        ])),
                  ),
                ),
              )),
    ));
  }

  SizedBox cardView(List<Quote> vm, List<Widget> cards) {
    return SizedBox.expand(
      child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.85,
          alignment: FractionalOffset.center,
          child: TCard(
            cards: vm.isNotEmpty ? cards : [Text("Empty")],
          )),
    );
  }
}
