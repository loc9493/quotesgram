import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/utils/Constant.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<QuoteViewModel>(context);
    return BottomAppBar(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              Constant.tabbar.length,
              (index) => IconButton(
                  color: vm.selectedTab == index
                      ? Constant.ColorHightLight
                      : Colors.white,
                  onPressed: () => {vm.setSelectedTab(index)},
                  icon: Constant.tabbar[index]))),
    );
  }
}
