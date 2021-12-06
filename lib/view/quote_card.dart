import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
            fit: BoxFit.fitHeight,
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chúa thỉnh thoảng lại tạo nên điều kỳ diệu; Nhìn kìa, một luật sư, con người trung thực.\nGod works wonders now and then; Behold a lawyer, an honest man.",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            "- Benjamin Franklin",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 24,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    splashRadius: 5,
                    icon: Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    onPressed: () => {},
                    splashRadius: 5,
                    icon: Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
