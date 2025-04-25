class AppImages {
  static const assetImagePath = 'assets/images/';
  static const assetLottiesPath = 'assets/lotties/';
  static const iconsPath = 'assets/icons/';

  static String _concatPathAndImage(String icon, {String? path}) {
    return path == null ? assetImagePath + icon : path + icon;
  }

  static String _concatPathAndLottie(String icon, {String? path}) {
    return path == null ? assetLottiesPath + icon : path + icon;
  }

  static final introBackgroundImg = _concatPathAndImage("intro.jpeg");
  static final placeHolderIconImage = _concatPathAndImage(
    "placeholder_icon_image.svg",
  );
  static final applogo = _concatPathAndImage("app_logo.png");
  static final appLogoHomePage = _concatPathAndImage("app_logo_home_page.png");
  static final appRatingIcon = _concatPathAndImage("app_rating_icon.svg");
  static final eyeIcon = _concatPathAndImage("eye_icon.svg");
  static final introIcon = _concatPathAndImage("intro_icon.png");
  static final leftArrowIcon = _concatPathAndImage("left_arrow.svg");
  static final rightArrowIcon = _concatPathAndImage("right_arrow.svg");
  static final quoteIcon = _concatPathAndImage("quote_icon.svg");
  static final heartIcon = _concatPathAndImage("heart_icon.svg");
  static final cloudIcon = _concatPathAndImage("cloud_icon.png");
  static final appLogoWithOutLogoIcon = _concatPathAndImage("applogo_without_name.svg");
  static final phoneIconGlory = _concatPathAndImage("phone_icon_glory.png");
  static final introMockupGlory = _concatPathAndImage("glory_intro_mockup.png");
  static final ratingImageIconGlory = _concatPathAndImage("rating_image_icon.svg");
  static final messiahIconGlory = _concatPathAndImage("messiah_icon.png");
  static final sliderCandleIconGlory = _concatPathAndImage("slider_candle_icon.svg");
  static final prayIconGlory = _concatPathAndImage("pray_icon.svg");
  static final chatIconGlory = _concatPathAndImage("chat_icon.svg");
  static final heartFilledIconGlory = _concatPathAndImage("heart_fill_icon.svg");
  static final googleIconGlory = _concatPathAndImage("google_icon.svg");
  // Lotties
  static final loadingLottie = _concatPathAndLottie("loading.json");
  static final bibleLottie = _concatPathAndLottie("bible.json");
}
