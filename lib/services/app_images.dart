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
  static final mobBlankScreenGlory = _concatPathAndImage("mob_screen.png");
  static final calendarIconGlory = _concatPathAndImage("calendar_icon.svg");
  static final bibleIconGlory = _concatPathAndImage("bible_icon.svg");
  static final settingsIconGlory = _concatPathAndImage("settings_icon.svg");
  static final shareIconGlory = _concatPathAndImage("share_icon.svg");
  static final homeTIconGlory = _concatPathAndImage("home_t_icon.svg");
  static final menuIconGlory = _concatPathAndImage("menu_icon.svg");
  
  
  // Settings Page Icons
  static final starIconGlory = _concatPathAndImage("star_icon.svg");
  static final phoneIconSettingPageGlory = _concatPathAndImage("phone_icon.svg");
  static final branchIconGlory = _concatPathAndImage("branch_icon.svg");
  static final genderIconGlory = _concatPathAndImage("gender_icon.svg");
  static final contactSupportIconGlory = _concatPathAndImage("contact_support_icon.svg");
  static final logOutIconGlory = _concatPathAndImage("logout_icon.svg");
  static final notificationIconGlory = _concatPathAndImage("notification_icon.svg");
  static final chatImgBackgroundIconGlory = _concatPathAndImage("chat_img_background.png");
  static final cancelIconGlory = _concatPathAndImage("cancel_icon.svg");


  // Bible Images
  static final bibleIcon1Glory = _concatPathAndImage("bible1.png");
  static final bibleIcon2Glory = _concatPathAndImage("bible2.png");
  static final bibleIcon3Glory = _concatPathAndImage("bible3.png");
  static final bibleIcon4Glory = _concatPathAndImage("bible4.png");
  static final bibleIcon5Glory = _concatPathAndImage("bible5.png");
  static final bibleIcon6Glory = _concatPathAndImage("bible6.png");
  static final bibleIcon7Glory = _concatPathAndImage("bible7.png");
  static final bibleIcon8Glory = _concatPathAndImage("bible8.png");
  static final bibleIcon9Glory = _concatPathAndImage("bible9.png");



  // Face Icons

  static final smileIcon = _concatPathAndImage("smile_icon.svg");
  static final smileIconWithStar = _concatPathAndImage("smile_icon_with_star.svg");
  static final regularFaceIcon = _concatPathAndImage("regular_face_icon.svg");
  static final unconvincedFaceIcon = _concatPathAndImage("unconvinced_face_icon.svg");
  static final excitedFaceIcon = _concatPathAndImage("excited_face_icon.svg");
  static final dissapointedFaceIcon = _concatPathAndImage("dissapointed_face_icon.svg");
  static final amazedFaceIcon = _concatPathAndImage("amazed_face_icon.svg");
  static final inactiveFaceIcon = _concatPathAndImage("inactive_face_icon.svg");
  static final dissatisfiedFaceIcon = _concatPathAndImage("dissatisfied_face_icon.svg");
  static final angryFaceIcon = _concatPathAndImage("angry_face_icon.svg");

  

  
  // Lotties
  static final loadingLottie = _concatPathAndLottie("loading.json");
  static final bibleLottie = _concatPathAndLottie("bible.json");
}
