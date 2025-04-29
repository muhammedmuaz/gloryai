import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroBeginningScreen extends StatefulWidget {
  const IntroBeginningScreen({super.key});

  @override
  State<IntroBeginningScreen> createState() => _IntroBeginningScreenState();
}

class _IntroBeginningScreenState extends State<IntroBeginningScreen> {
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
    final mockupDelay = subtitleDelay + subtitleDuration;
    final mockupDuration = 800.ms;
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
              AddHeight(0.03),
              Text(
                'This is just the beginning...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
              AddHeight(0.01),
              Text(
                'Your moments with God, captured',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
              AddHeight(0.04),
              Expanded(
                child: GloryAiAssetImage(imagePath: AppImages.introMockupGlory)
                    .animate(delay: mockupDelay)
                    .fadeIn(duration: mockupDuration)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: mockupDuration,
                      curve: Curves.easeOutBack,
                    )
                    .then(delay: mockupDuration)
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .moveY(
                      begin: -10,
                      end: 10,
                      duration: 1000.ms,
                      curve: Curves.easeInOut,
                    ),
              ),
              AddHeight(0.12),
            ],
          ),
        ),
      ),

      // Next button with enhanced animations
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

             GestureDetector(
            onTap: () {
                  AppNavigation.navigateTo(AppRoutesNames.introRating2Screen);

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
                        'Next',
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
