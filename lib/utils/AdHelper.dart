import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String interstialAdpubID() {
    //Develop pub id
    return Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/4411468910';
  }

  static String bannerAdpubID() {
    //Develop pub id
    return Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716';
    //Production pub id
    // return Platform.isAndroid
    //     ? 'ca-app-pub-3940256099942544/6300978111'
    //     : 'ca-app-pub-1436979433677675/6119992154';
  }

  static BannerAd homeBanner = BannerAd(
    adUnitId: bannerAdpubID(),
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  static BannerAd detailBanner = BannerAd(
    adUnitId: bannerAdpubID(),
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
}
