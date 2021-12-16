import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/utils/Constant.dart';
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
        print(imgFile);
        var result = await GallerySaver.saveImage(imgFile.path);
        if (result != null && result == true) {
          Fluttertoast.showToast(
              msg: "Saved to library",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Constant.Persian,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "Cannot save this file",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context);
    var wallpaper = vm.wallpaper?.url() ??
        "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80";
    return Hero(
      tag: widget.quote.id ?? 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RepaintBoundary(
              key: genKey,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.width * 1,
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CachedNetworkImage(
                                  imageUrl: wallpaper, fit: BoxFit.cover)),
                          Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Constant.ColorBackground.withAlpha(80),
                                child: null,
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.quote.content ?? "",
                                  style: vm.contentStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    widget.quote.author?.name ?? "",
                                    style: vm.authorStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => {_capturePng()},
                    icon: const Icon(Icons.save)),
                IconButton(onPressed: () => {}, icon: const Icon(Icons.share))
              ],
            )
          ],
        ),
      ),
    );
  }
}
