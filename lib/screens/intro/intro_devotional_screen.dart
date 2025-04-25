import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroDevotionalScreen extends StatelessWidget {
  const IntroDevotionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);

    // Animation timing control
    final logoDuration = 800.ms;
    final titleDelay = logoDuration * 0.5;
    final titleDuration = 600.ms;
    final subtitleDelay = titleDelay + titleDuration * 0.5;
    final subtitleDuration = 500.ms;
    final phoneDelay = subtitleDelay + subtitleDuration;
    final phoneDuration = 800.ms;
    final bottomElementsDelay = phoneDelay + phoneDuration * 0.5;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddHeight(0.05),
              // Logo with enhanced animations
              SizedBox(
                width: width * 0.6,
                child: GloryAiAssetImage(imagePath: AppImages.applogo),
              ),

              AddHeight(0.05),
              Text(
                'Today\'s Devotional\nJourney',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  height: 1.3,
                ),
              ),

              AddHeight(0.03),
              Text(
                'Your moments with God,\nbeautifully captured',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  height: 1.4,
                ),
              ),
              AddHeight(0.04),
              SizedBox(
                height: height * 0.4,
                child: GloryAiAssetImage(imagePath: AppImages.phoneIconGlory)
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .moveY(
                      begin: -10,
                      end: 10,
                      duration: 2500.ms,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
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
                  AppNavigation.navigateTo(AppRoutesNames.introQuotesSliderScreen);
              },
                child: Container(
                      height: 55,
                      width: width * 0.85,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: DesignConstants.kTextGreenColor,
                        boxShadow: [
                          BoxShadow(
                            color: DesignConstants.kTextGreenColor.withOpacity(
                              0.3,
                            ),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            DesignConstants.kTextGreenColor.withOpacity(0.9),
                            DesignConstants.kTextGreenColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Proceed',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate(
                      delay: bottomElementsDelay,
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .shimmer(
                      delay: 2000.ms,
                      duration: 1000.ms,
                      color: Colors.white.withOpacity(0.2),
                    )
                    .scaleXY(
                      begin: 1,
                      end: 1.02,
                      duration: 1500.ms,
                      curve: Curves.easeInOut,
                    ),
              ),
              AddHeight(0.015),
              AddHeight(0.015),
            ],
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
