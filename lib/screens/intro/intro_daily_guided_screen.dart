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

class IntroDailyGuidedScreen extends StatelessWidget {
  const IntroDailyGuidedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: DesignConstants.kLightColor,
                            ),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                          AddHeight(0.005),
                          Text(
                            'Daily Guided Devotionals',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: DesignConstants.kTextGreenColor,
                            ),
                          ),
                          AddHeight(0.01),
                          Text(
                            'Experience inspirational messages each day',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      ),
                      AddHeight(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: DesignConstants.kLightColor,
                            ),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                          AddHeight(0.005),
                          Text(
                            'Limitless Prayer Resource',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: DesignConstants.kTextGreenColor,
                            ),
                          ),
                          AddHeight(0.01),
                          Text(
                            'Access abundant prayer materials at no cost.',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      ),
                      AddHeight(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: DesignConstants.kLightColor,
                            ),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                          AddHeight(0.005),
                          Text(
                            'Personalized Guidance Conversations',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: DesignConstants.kTextGreenColor,
                            ),
                          ),
                          AddHeight(0.01),
                          Text(
                            'Engage in spiritual discussions and receive tailored advice.',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      ),
                      AddHeight(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: DesignConstants.kLightColor,
                            ),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                          AddHeight(0.005),
                          Text(
                            'I want to explore the app for free',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: DesignConstants.kTextGreenColor,
                            ),
                          ),
                          AddHeight(0.01),
                          Text(
                            'Absolutely free-no hidden fees.',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                AddHeight(0.2),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'No risks, no charges.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: DesignConstants.kTextPurpleColor,
                  letterSpacing: -0.2,
                ),
              ),
              Text(
                'Join anytime without obligations.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          AddHeight(0.01),

          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(AppRoutesNames.homeScreen2);
            },
            child: Container(
                  width: width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 4, color: Colors.white),
                    color: DesignConstants.kTextGreenColor,
                    boxShadow: [
                      BoxShadow(
                        color: DesignConstants.kTextGreenColor.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        DesignConstants.kTextGreenColor,
                        DesignConstants.kTextGreenColor.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start for Free',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                ),
          ),
          AddHeight(0.01),
          GestureDetector(
            onTap: () {
              HelperFunctions.launchLink(context, url: "https://gloryai.com");
            },
            child: Text(
              'Terms • Privacy',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DesignConstants.kTextPurpleColor,
                letterSpacing: -0.2,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
