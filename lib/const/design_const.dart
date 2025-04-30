import 'package:flutter/material.dart';

class DesignConstants {
  // --- Existing Theme Colors ---
  static const Color kPrimaryColor = Color(0xFF3E8D93); // Note: Added FF for opacity consistency
  static const Color kSecondaryColor = Color(0xFFFBB75D);

  // --- Existing Extracted from SVGs ---
  static const Color kBackgroundStartColor = Color(0xFFF9EBE2);
  static const Color kBackgroundEndColor = Color(0xFFFFFFFF);
  static const Color kAccentColor = Color(0xFFF4D8C8);
  static const Color kTextPurpleColor = Color(0xFF391563);
  static const Color kTextLightColor = Color(0xFFE4A3A0);
  static const Color kTextGreenColor = Color(0xFF00C478);
  static const Color kHomeBoxColor = Color(0xFFf2d3c4);
  static const Color kHomeBoxColor2 = Color(0xFFf6ded0);

  





  // --- New Palette (from CSS/SCSS) ---
  static const Color kWhiteLinen = Color(0xFFfbf4ef);
  static const Color kShilo = Color(0xFFe3a3a4);
  static const Color kScarletGum = Color(0xFF3e1665);
  static const Color kCaribbeanGreen = Color(0xFF06c47d);
  static const Color kTrendyPink = Color(0xFF876f9c);
  static const Color kAmethystSmoke = Color(0xFFa69bb6);
  static const Color kBlossom = Color(0xFFdcb1b8);
  static const Color kRoseFog = Color(0xFFeac2bc);
  static const Color kGhost = Color(0xFFcecfd7);
  static const Color kDustStorm = Color(0xFFe6cbcf);
  static const Color kFbBtnColor = Color(0xFF0665fe);

  // --- Existing Gradient ---
  static LinearGradient get backgroundGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [kBackgroundStartColor, kBackgroundEndColor],
      );
}