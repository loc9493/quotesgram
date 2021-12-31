import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/view_model/quote_view_model.dart';

class WallpaperSlider extends StatelessWidget {
  const WallpaperSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuoteViewModel vm = Provider.of<QuoteViewModel>(context);
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                const Text("Opacity", style: TextStyle(color: Colors.white)),
                Expanded(
                  child: Slider(
                    value: vm.wallpaperOpacity,
                    divisions: 10,
                    onChanged: (value) {
                      vm.setWallpaperOpacity(value);
                    },
                    max: 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.wallpapers.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => {vm.setWallpaper(vm.wallpapers[index])},
                      child: Container(
                        padding: const EdgeInsets.all(10),
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
