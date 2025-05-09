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

class GloryBibleLinesExplanationScreen extends StatelessWidget {
  const GloryBibleLinesExplanationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);

    // Animation delays for coordinated sequencing
    const initialDelay = 300;
    const animationDuration = 600;

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
          child: Stack(
            children: [
              // Background cloud with subtle floating animation
              Center(
                child: Container(
                  width: width,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.cloudIcon)
                      .animate(
                        delay: (initialDelay + 200).ms,
                        onPlay: (controller) => controller.repeat(),
                      )
                      .moveY(
                        begin: 0,
                        end: -10,
                        duration: 3000.ms,
                        curve: Curves.easeInOut,
                      )
                      .then()
                      .moveY(
                        begin: -10,
                        end: 0,
                        duration: 3000.ms,
                        curve: Curves.easeInOut,
                      ),
                ),
              ),

              SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddHeight(0.05),

                    // Logo with gentle scale and fade animation
                    SizedBox(
                      width: width * 0.6,
                      child: GloryAiAssetImage(imagePath: AppImages.applogo)
                          .animate(delay: initialDelay.ms)
                          .scaleXY(
                            begin: 0.8,
                            end: 1,
                            curve: Curves.easeOutBack,
                            duration: animationDuration.ms,
                          )
                          .fadeIn(duration: (animationDuration * 0.8).ms),
                    ),

                    AddHeight(0.15),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      child: Text(
                            'Glory Explains :',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          )
                          .animate(delay: (initialDelay + 200).ms)
                          .fadeIn(
                            duration: (animationDuration * 0.7).ms,
                            curve: Curves.easeOutCubic,
                          )
                          .slideY(
                            begin: 0.2,
                            end: 0,
                            duration: animationDuration.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    ),
AddHeight(0.03),
                    // Bible verse with sequenced animation
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      child: Text(
                            'This verse means that God\'s Word (the Bible) guides our daily steps like a lamp lighting a dark path, giving us wisdom for the present and direction for the future.',
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: DesignConstants.kTextPurpleColor,

                            ),
                          )
                          .animate(delay: (initialDelay + 200).ms)
                          .fadeIn(
                            duration: (animationDuration * 0.7).ms,
                            curve: Curves.easeOutCubic,
                          )
                          .slideY(
                            begin: 0.2,
                            end: 0,
                            duration: animationDuration.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    ),

                  ],
                ),
              ),
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
              AppNavigation.pushReplacementTo(AppRoutesNames.chatScreen);
            },
            child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                )
                .animate(delay: (initialDelay + 800).ms)
                .fadeIn(duration: animationDuration.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: animationDuration.ms,
                  curve: Curves.easeOutBack,
                )
                .then()
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  delay: 1000.ms,
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.3),
                )
                .animate(onPlay: (controller) => controller.repeat()),
          ),
          AddHeight(0.02),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
