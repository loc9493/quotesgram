import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quotesgram/utils/AdHelper.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view/card_holder.dart';
import 'package:quotesgram/view/horizontal_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: CardHolder()),
        Container(
          height: 50,
          child: AdWidget(ad: AdHelper.homeBanner),
        )
      ],
    );
  }
}
