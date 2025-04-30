import 'package:flutter/material.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/services/app_images.dart';

class ImagePreloader {
  static Future<void> preloadImages() async {
    try {
      // Preload main images that appear on first screen
      await Future.wait([
        precacheImage(
          AssetImage(AppImages.cloudIcon),
          AppNavigation.navigatorKey.currentContext!,
        ),
        precacheImage(
          AssetImage(AppImages.introMockupGlory),
          AppNavigation.navigatorKey.currentContext!,
        ),
        precacheImage(
          AssetImage(AppImages.messiahIconGlory),
          AppNavigation.navigatorKey.currentContext!,
        ),
        // precacheImage(
        //   AssetImage(AppImages.sliderCandleIconGlory),
        //   AppNavigation.navigatorKey.currentContext!,
        // ),
        // precacheImage(
        //   AssetImage(AppImages.prayIconGlory),
        //   AppNavigation.navigatorKey.currentContext!,
        // ),
      ]);
    } catch (e) {
      debugPrint('Error preloading images: $e');
    }
  }
}
