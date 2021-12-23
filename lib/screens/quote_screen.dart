import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/quote.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view/bottom_bar.dart';
import 'package:quotesgram/view/quote_card.dart';
import 'package:quotesgram/view/text_editor.dart';
import 'package:quotesgram/view/wallpaper_slider.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';
import 'package:text_style_editor/text_style_editor.dart';

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
              child: QuoteCard(quote: quote),
            ),
            Container(
              child: SizedBox(
                height: 150,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constant.CardConfigs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () => {
                          handleCardConfig(
                              Constant.CardConfigs[index], context, vm)
                        },
                        child: Card(
                            color: Constant.Persian,
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Constant.CardConfigIcon(
                                    Constant.CardConfigs[index]),
                                Text(
                                  Constant.CardConfigTitle(
                                      Constant.CardConfigs[index]),
                                  style: const TextStyle(
                                      color: Constant.Crayola,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  handleCardConfig(CardConfig config, BuildContext context, QuoteViewModel vm) {
    Widget? widget = null;
    switch (config) {
      case CardConfig.Wallpaper:
        widget = WallpaperSlider();
        break;
      case CardConfig.Save:
        break;
      case CardConfig.AuthorText:
      case CardConfig.ContentText:
        widget = TextEditor(
          config: config,
        );
        break;
      default:
    }
    if (widget != null) {
      showBottomSheet(
          context: context,
          builder: (context) => Container(
                padding: const EdgeInsets.all(10),
                color: Constant.ColorBackground,
                child: widget,
              ));
    }
  }
}
