import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotesgram/view/quote_card.dart';

class CardHolder extends StatelessWidget {
  const CardHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const arrColors = [Colors.red, Colors.green, Colors.yellow];
    return SizedBox.expand(
      child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.85,
          alignment: FractionalOffset.center,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 20,
                right: 20,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: arrColors[0],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                bottom: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: arrColors[1],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                bottom: 0,
                child: QuoteCard(),
              )
            ],
          )),
    );
  }
}
