import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/screens/intro/intro_always_together_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroWhereFindScreen extends StatelessWidget {
  const IntroWhereFindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing constants
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final optionsDelay = taglineDelay + taglineDuration;
    final optionsDuration = 800.ms;
    final bottomElementsDelay = optionsDelay + optionsDuration * 0.5;
    final bottomElementsDuration = 700.ms;

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
              // --- Enhanced Logo Animation ---
              SizedBox(
                width: width * 0.6,
                child: GloryAiAssetImage(imagePath: AppImages.applogo),
              )
              .animate()
              .fadeIn(
                duration: logoDuration,
                curve: Curves.easeOutQuint,
              )
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1, 1),
                duration: logoDuration,
                curve: Curves.easeOutBack,
              )
              .then(delay: 300.ms)
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .moveY(
                begin: -4,
                end: 4,
                duration: 3000.ms,
                curve: Curves.easeInOutSine,
              ),
              AddHeight(0.05),
              // --- Animated Tagline with Enhanced Effects ---
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                child: Text(
                  'Where\ndid you find out\nabout Glory ?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                    height: 1.3,
                  ),
                )
                .animate(delay: taglineDelay)
                .fadeIn(
                  duration: taglineDuration,
                  curve: Curves.easeOutQuint,
                )
                .slideY(
                  begin: 0.2,
                  end: 0,
                  duration: taglineDuration,
                  curve: Curves.easeOutBack,
                )
                .blur(
                  begin: const Offset(4, 0),
                  end: const Offset(0, 0),
                  duration: taglineDuration,
                ),
              ),
              AddHeight(0.05),
              // --- Animated Options with Staggered Effects ---
              Column(
                children: [
                  _buildCircularOption(
                    context,
                    'Facebook',
                    optionsDelay + 0.ms,
                  ),
                  AddHeight(0.01),
                  _buildCircularOption(
                    context,
                    'Instagram',
                    optionsDelay + 100.ms,
                  ),
                  AddHeight(0.01),
                  _buildCircularOption(
                    context,
                    'TikTok',
                    optionsDelay + 200.ms,
                  ),
                  AddHeight(0.01),
                  _buildCircularOption(
                    context,
                    'Friends',
                    optionsDelay + 300.ms,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // --- Enhanced Bottom Button Animation ---
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                final RenderBox button = context.findRenderObject() as RenderBox;
                final buttonPosition = button.localToGlobal(Offset.zero);
                final buttonSize = button.size;
                final buttonCenter = Offset(
                  buttonPosition.dx + buttonSize.width / 2,
                  buttonPosition.dy + buttonSize.height / 2,
                );

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 800),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const IntroAlwaysTogetherScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return ClipPath(
                        clipper: CircleRevealClipper(
                          fraction: animation.value,
                          center: buttonCenter,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: AnimatedContainer(
                duration: 300.ms,
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
                      color: DesignConstants.kTextGreenColor.withOpacity(0.3),
                      blurRadius: 10,
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
                      'Next',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .animate(delay: bottomElementsDelay)
          .fadeIn(duration: bottomElementsDuration)
          .slideY(
            begin: 0.4,
            end: 0,
            duration: bottomElementsDuration,
            curve: Curves.easeOutQuint,
          )
          .then()
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
          AddHeight(0.015),
          AddHeight(0.015),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

Widget _buildCircularOption(BuildContext context, String title, Duration delay) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: DataConstants.kScreenHorizontalPadding),
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: DesignConstants.kTextLightColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 21,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    )
    .animate(delay: delay)
    .fadeIn(
      duration: 500.ms,
      curve: Curves.easeOutQuint,
    )
    .slideY(
      begin: 0.2,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOutBack,
    )
    .custom(
      begin: 0,
      end: 1,
      builder: (_, value, child) {
        // Ensure opacity stays within valid range
        final clampedValue = value.clamp(0.0, 1.0);
        return Transform.scale(
          scale: 0.5 + (clampedValue * 0.5),
          child: Opacity(
            opacity: clampedValue,
            child: child,
          ),
        );
      },
    ),
  );
}
}