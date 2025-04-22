import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/intro/intro_tradition_select_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroGenderSelectScreen extends StatelessWidget {
  const IntroGenderSelectScreen({super.key});

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
    final cloudDelay = optionsDelay + optionsDuration * 0.5;
    final cloudDuration = 600.ms;
    final bottomElementsDelay = cloudDelay + cloudDuration * 0.5;
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
          child: ScreenPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddHeight(0.05),
                // Logo with enhanced animation
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
                )
                .then()
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  delay: 2000.ms,
                  duration: 3000.ms,
                  color: Colors.white.withOpacity(0.1),
                ),

                AddHeight(0.05),
                // Title with polished animation
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  child: Text(
                    'How\nshould Glory\naddress you?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                      height: 1.3,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
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
                // Gender options with staggered animations
                Column(
                  children: [
                    _buildGenderOption(
                      context,
                      'Male',
                      optionsDelay + 0.ms,
                    ),
                    AddHeight(0.01),
                    _buildGenderOption(
                      context,
                      'Female',
                      optionsDelay + 100.ms,
                    ),
                  ],
                ),

                // Cloud icon with floating animation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: GloryAiAssetImage(imagePath: AppImages.cloudIcon)
                  .animate(delay: cloudDelay)
                  .fadeIn(duration: cloudDuration)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                    duration: cloudDuration,
                    curve: Curves.easeOutBack,
                  )
                  .then()
                  .animate(onPlay: (controller) => controller.repeat())
                  .moveY(
                    begin: -5,
                    end: 5,
                    duration: 3000.ms,
                    curve: Curves.easeInOutSine,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Enhanced floating action button
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
                        const IntroTraditionSelectScreen(),
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

  Widget _buildGenderOption(BuildContext context, String title, Duration delay) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
            fontWeight: FontWeight.w500,
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
      
    );
  }
}