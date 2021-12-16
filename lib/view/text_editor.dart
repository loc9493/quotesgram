import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';
import 'package:text_style_editor/text_style_editor.dart';

class TextEditor extends StatelessWidget {
  const TextEditor({Key? key, required this.config}) : super(key: key);
  final CardConfig config;
  @override
  Widget build(BuildContext context) {
    QuoteViewModel vm = Provider.of<QuoteViewModel>(context);
    return TextStyleEditor(
        fonts: [],
        paletteColors: Constant.ColorsList,
        textStyle: vm.getStyleForConfig(config),
        onTextStyleEdited: (p0) {
          Function? updateFunction = vm.getUpdateStyleFunctionForConfig(config);
          if (updateFunction != null) {
            updateFunction(p0);
          }
        },
        onTextAlignEdited: (p0) {
          Function? updateFunction = vm.getUpdateAlginFunctionForConfig(config);
          if (updateFunction != null) {
            updateFunction(p0);
          }
        },
        textAlign: vm.getAlignForConfig(config));
  }
}
