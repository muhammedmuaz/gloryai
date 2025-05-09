import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/calendar_screen.dart';
import 'package:gloryai/screens/select_bible_version.dart';
import 'package:gloryai/screens/widgets/settings_tile.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int activeWidget = 0;
  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);

    List<Widget> homeScreens = [
      Stack(
        children: [
          Positioned(
            bottom: height * 0.06,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,

                  child: GloryAiAssetImage(imagePath: AppImages.cloudIcon),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: height * 0.35,
                  child: GloryAiAssetImage(
                    imagePath: AppImages.homeTIconGlory,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          ScreenPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: DesignConstants.kHomeBoxColor2,
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),

                          GestureDetector(
                            onTap: () {
                              AppNavigation.navigateTo(
                                AppRoutesNames.notificationListScreen,
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: DesignConstants.kHomeBoxColor2,
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: DesignConstants.kTextLightColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                      child: GloryAiAssetImage(
                        imagePath: AppImages.appLogoHomePage,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: DesignConstants.kTextLightColor,
                      ),
                      child: Icon(
                        Icons.tag_faces_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                AddHeight(0.02),
                Container(
                  height: 90,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: DesignConstants.kHomeBoxColor2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good morning, John,',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: DesignConstants.kTextPurpleColor,
                        ),
                      ),
                      Text(
                        'Walking in his truth',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                AddHeight(0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Today\'s Scripture',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: DesignConstants.kTextLightColor,
                      ),
                    ),
                  ],
                ),
                AddHeight(0.025),
                Text(
                  'and the messenger of the Lord appeared to him and said: The Lord is with you, you mighty warrior',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
                AddHeight(0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Judge 6:12',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextGreenColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                AddHeight(0.01),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: DesignConstants.kCaribbeanGreen,
                    ),
                  ),
                  child: Text(
                    'Help me understand',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextGreenColor,
                      letterSpacing: -0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Positioned(
            bottom: height * 0.06,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: height * 0.35,
                  child: GloryAiAssetImage(
                    imagePath: AppImages.homeTIconGlory,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          CalendarPage(),
        ],
      ),
      SelectBibleVersion(),
      Stack(
        children: [
          Positioned(
            bottom: height * 0.06,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.maxFinite,
              height: height * 0.35,
              child: GloryAiAssetImage(
                imagePath: AppImages.homeTIconGlory,
                fit: BoxFit.fill,
              ),
            ),
          ),

          ScreenPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: DesignConstants.kHomeBoxColor2,
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),

                          GestureDetector(
                            onTap: () {
                              AppNavigation.navigateTo(
                                AppRoutesNames.notificationListScreen,
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: DesignConstants.kHomeBoxColor2,
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: DesignConstants.kTextLightColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                      child: GloryAiAssetImage(
                        imagePath: AppImages.appLogoHomePage,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: DesignConstants.kTextLightColor,
                      ),
                      child: Icon(
                        Icons.tag_faces_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: 'heading',
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ),
                ),
                AddHeight(0.015),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SettingsTile(
                          title: 'Rate Us',
                          iconPath: AppImages.starIconGlory,
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Lock Screen',
                          iconPath: AppImages.phoneIconSettingPageGlory,
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Branch',
                          iconPath: AppImages.branchIconGlory,
                          onTap: () {
                            AppNavigation.navigateTo(
                              AppRoutesNames.editTraditionSelectScreen,
                            );
                          },
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Gender',
                          iconPath: AppImages.genderIconGlory,
                          onTap: () {
                            AppNavigation.navigateTo(
                              AppRoutesNames.editGenderSelectScreen,
                            );
                          },
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Notifications',
                          iconPath: AppImages.notificationIconGlory,
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Contact Support',
                          iconPath: AppImages.contactSupportIconGlory,
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Log Out',
                          iconPath: AppImages.logOutIconGlory,
                        ),
                        AddHeight(0.008),
                        SettingsTile(
                          title: 'Terms & Conditions',
                          iconPath: null,
                        ),
                        AddHeight(0.008),
                        SettingsTile(title: 'Privacy Policy', iconPath: null),
                        AddHeight(0.008),
                        SettingsTile(title: 'Delete Account', iconPath: null),
                        AddHeight(0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2025 glory.ai All Rights Reserved',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Glory.ai Version 1.0',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextPurpleColor,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Container(
        // Existing decoration
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: SizedBox(
            height: height,
            width: width,
            child: homeScreens[activeWidget],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (activeWidget != 1 && activeWidget != 3) ...[
            GestureDetector(
              onTap: () {
                AppNavigation.navigateTo(AppRoutesNames.chatScreen);
              },
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: DesignConstants.kTextGreenColor,
                  boxShadow: [
                    BoxShadow(
                      color: DesignConstants.kTextGreenColor.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Devotional',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AddHeight(0.03),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  activeWidget = 0;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 0
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.prayIconGlory),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 1;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 1
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(
                    imagePath: AppImages.calendarIconGlory,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 2;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 2
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.bibleIconGlory),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 3;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 3
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(
                    imagePath: AppImages.settingsIconGlory,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 4
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.shareIconGlory),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
