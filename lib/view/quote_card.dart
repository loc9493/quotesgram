import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

class QuoteCard extends StatefulWidget {
  const QuoteCard({
    Key? key,
    required this.quote,
  }) : super(key: key);
  final Quote quote;

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  final GlobalKey genKey = GlobalKey();

  Future<void> _capturePng() async {
    RenderRepaintBoundary? boundary =
        genKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary != null) {
      ui.Image image = await boundary.toImage(pixelRatio: 4.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = (await getApplicationDocumentsDirectory()).path;

        File imgFile = File('$directory/${widget.quote.id}.png');
        await imgFile.writeAsBytes(pngBytes);
        print(imgFile.path);
        print(pngBytes);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context);
    var wallpaper = vm.wallpaper?.url() ??
        "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80";
    return RepaintBoundary(
        key: genKey,
        child: Hero(
          tag: widget.quote.id ?? 0,
          child: Text("Nice"),
        ));
  }
}
