import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroNeverMissDailyScreen extends StatefulWidget {
  const IntroNeverMissDailyScreen({super.key});

  @override
  State<IntroNeverMissDailyScreen> createState() =>
      _IntroNeverMissDailyScreenState();
}

class _IntroNeverMissDailyScreenState extends State<IntroNeverMissDailyScreen> {
  @override
  Widget build(BuildContext context) {
    final logoDuration = 100.ms;
    final titleDelay = logoDuration * 0.5;
    final titleDuration = 100.ms;
    final subtitleDelay = titleDelay + titleDuration * 0.5;
    final subtitleDuration = 300.ms;
    final mockupDelay = subtitleDelay + subtitleDuration;
    final mockupDuration = 600.ms;
    // Add these animation durations at the top of your State class
    final firstBoxDelay = 700.ms; // Delay after phone appears
    final firstBoxDuration = 900.ms;
    final secondBoxDelay =
        firstBoxDelay + firstBoxDuration + 200.ms; // Small gap between boxes
    final secondBoxDuration = 500.ms;
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DesignConstants.kBackgroundEndColor,
              DesignConstants.kBackgroundStartColor,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: Column(
              children: [
                AddHeight(0.05),
                SizedBox(
                  width: width * 0.6,
                  child: GloryAiAssetImage(imagePath: AppImages.applogo),
                ),
                AddHeight(0.03),
                // Tagline with attention-grabbing animation
                Text(
                  'Never Miss Your Daily Spiritual Time?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),

                AddHeight(0.01),
                Text(
                  'Gentle reminders to help nurture your daily walk with God',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
                AddHeight(0.03),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: GloryAiAssetImage(
                              imagePath: AppImages.mobBlankScreenGlory,
                            )
                            .animate(delay: mockupDelay)
                            .fadeIn(duration: mockupDuration)
                            .slideY(
                              begin: 0.3,
                              end: 0,
                              duration: mockupDuration,
                              curve: Curves.easeOutBack,
                            ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextLightColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: DesignConstants.kTextPurpleColor,
                                    width: 1.1,
                                  ),
                                ),
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Leading widget (image)
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GloryAiAssetImage(
                                              imagePath:
                                                  AppImages
                                                      .appLogoWithOutLogoIcon,
                                            ),
                                            AddHeight(0.02),
                                            Text(
                                              '8:45',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ), // Add spacing between leading and text
                                        // Text content
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Title
                                              Text(
                                                'Scripture of the Day',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DesignConstants
                                                              .kTextPurpleColor,
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ), // Add spacing between title and subtitle
                                              // Subtitle
                                              Text(
                                                'May the God who gives endurance and encouragement give you the same attitude of mind toward each other that Christ Jesus had.',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DesignConstants
                                                              .kTextPurpleColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .animate(delay: firstBoxDelay)
                              .fadeIn(duration: firstBoxDuration)
                              .slideY(
                                begin: 0.3,
                                end: 0,
                                curve: Curves.easeOutCubic,
                              ),
                          AddHeight(0.02),
                          Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextLightColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: DesignConstants.kTextPurpleColor,
                                    width: 1.1,
                                  ),
                                ),
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Leading widget (image)
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GloryAiAssetImage(
                                              imagePath:
                                                  AppImages
                                                      .appLogoWithOutLogoIcon,
                                            ),
                                            AddHeight(0.02),
                                            Text(
                                              '9:00',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ), // Add spacing between leading and text
                                        // Text content
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Title
                                              Text(
                                                'Start your day with Devotion',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DesignConstants
                                                              .kTextPurpleColor,
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ), // Add spacing between title and subtitle
                                              // Subtitle
                                              Text(
                                                'Begin your day 9:00 with a moment of spiritual reflection.',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DesignConstants
                                                              .kTextPurpleColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .animate(delay: secondBoxDelay)
                              .fadeIn(duration: secondBoxDuration)
                              .slideY(
                                begin: 0.3,
                                end: 0,
                                curve: Curves.easeOutCubic,
                              ),
                        ],
                      ),
                    ],
                  ),
                ),

                AddHeight(0.18),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              BottomSheetsAndDialogs.notificationDialogBox(
                context,
                onCancel: (){
                  AppNavigation.navigateTo(AppRoutesNames.introLoginScreen);
                },
                onAccept: () {
                  AppNavigation.navigateTo(AppRoutesNames.introLoginScreen);
                },
              );
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
                        'Stay Connected',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  delay: 1000.ms,
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.3),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.02, 1.02),
                  duration: 2000.ms,
                  curve: Curves.easeInOut,
                ),
          ),
          AddHeight(0.012),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Want the Lord’s word every morning?\nTap',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: DesignConstants.kTextPurpleColor.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: ' \'Allow\' ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: DesignConstants.kTextPurpleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'on the next screen to get it.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: DesignConstants.kTextPurpleColor.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
