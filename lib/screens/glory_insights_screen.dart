import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Add this import
import 'package:get/get.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/models/bible_books_model.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';

class GloryInsightsScreen extends StatefulWidget {
  const GloryInsightsScreen({super.key});

  @override
  State<GloryInsightsScreen> createState() => _GloryInsightsScreenState();
}

class _GloryInsightsScreenState extends State<GloryInsightsScreen> {
  int? _selectedIndex;
  final Duration _animationDuration = 300.ms;

  @override
  void initState() {
    // bibleVersion
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final UserProvider userProvider = Get.find();
      if (userProvider.userProfile != null) {
        for (var i = 0; i < bibleBooks.length; i++) {
          if (bibleBooks[i].name ==
              userProvider.userProfile!.bibleVersion!.toLowerCase()) {
            _selectedIndex = i;
            setState(() {});
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen =
        screenWidth < 600; // Example breakpoint for small screens

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: Column(
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
                          Container(
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
                Text(
                  'Glory Insight of Your Progress',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    top: 2.5,
                    left: 2.5,
                    right: 2.5,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: DesignConstants.kTextLightColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 18.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GloryAiAssetImage(imagePath: AppImages.smileIcon),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'You are a devoted student of the Holy Scriptures, and the measure of your devotion is moderate advanced.',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize:
                                      isSmallScreen
                                          ? 14
                                          : 16, // Adjust font size
                                  fontWeight: FontWeight.w500,
                                  color: DesignConstants.kTextPurpleColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AddHeight(0.012),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    top: 2.5,
                    left: 2.5,
                    right: 2.5,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: DesignConstants.kTextLightColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 18.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Make sure this is still here
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          // Changed from Expanded to Flexible
                          fit: FlexFit.loose, // Added FlexFit.loose
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GloryAiAssetImage(
                                imagePath: AppImages.smileIconWithStar,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                // Keep Expanded for the text column to take remaining width
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'How to Advance in Journeyer?',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: isSmallScreen ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: DesignConstants.kTextPurpleColor,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Advancing in Glory can mean achieving greater spiritual depth, closeness to God, or better understanding of faith.',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: isSmallScreen ? 14 : 16,
                                        fontWeight: FontWeight.w500,
                                        color: DesignConstants.kTextPurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: DesignConstants.kLightColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Here are some steps that can help on this journey:',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                    color: DesignConstants.kTextPurpleColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: DesignConstants.kTextLightColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AddHeight(0.015),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: DesignConstants.kLightDarkColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Your mental state at the given level',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AddHeight(0.015),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(mentalStates.length, (i) {
                      final mentalState = mentalStates[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GloryAiAssetImage(imagePath: mentalState.imgUrl),
                            SizedBox(height: 8),
                            Text(
                              mentalState.name,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: isSmallScreen ? 14 : 16,
                                fontWeight: FontWeight.w500,
                                color: DesignConstants.kTextPurpleColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
