import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class WallpaperSlider extends StatelessWidget {
  const WallpaperSlider({
    Key? key,
    required this.vm,
  }) : super(key: key);

  final QuoteViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.only(top: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.wallpapers.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => {vm.setWallpaper(vm.wallpapers[index])},
                      child: Container(
                        child: Center(
                            child: CachedNetworkImage(
                          imageUrl: vm.wallpapers[index].url(),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
