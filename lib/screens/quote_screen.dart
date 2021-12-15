import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/view/bottom_bar.dart';
import 'package:quotesgram/view/quote_card.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key, required this.quote}) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    final QuoteViewModel vm = Provider.of<QuoteViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: QuoteCard(quote: quote),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vm.wallpapers.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => {vm.setWallpaper(vm.wallpapers[index])},
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(
                              child: CachedNetworkImage(
                            imageUrl: vm.wallpapers[index].url(),
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
