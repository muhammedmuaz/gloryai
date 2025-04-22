import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/intro/intro_scripture_screen.dart';
import 'package:gloryai/screens/widgets/find_circular_container.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroTraditionSelectScreen extends StatelessWidget {
  const IntroTraditionSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing control
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final optionsDelay = taglineDelay + taglineDuration * 0.5;
    final optionsDuration = 500.ms;
    final staggerDelay = 200.ms;
    final bottomElementsDelay = optionsDelay + optionsDuration + staggerDelay;
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
                // Logo with floating and scaling animation
                SizedBox(
                  width: width * 0.6,
                  child: GloryAiAssetImage(imagePath: AppImages.applogo),
                )
                .animate()
                .scaleXY(
                  begin: 0.8,
                  end: 1,
                  duration: logoDuration,
                  curve: Curves.elasticOut,
                )
                .fadeIn(duration: logoDuration, curve: Curves.easeOut)
                .slideY(
                  begin: -0.2,
                  end: 0,
                  duration: logoDuration,
                  curve: Curves.easeOut,
                )
                .then(delay: 300.ms)
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  begin: -4,
                  end: 4,
                  duration: 2500.ms,
                  curve: Curves.easeInOutSine,
                ),

                AddHeight(0.05),
                // Tagline with attention-grabbing animation
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  child: Text(
                    'What\'s your\nChristian tradition?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  )
                  .animate(delay: taglineDelay)
                  .fadeIn(duration: taglineDuration, curve: Curves.easeOutCubic)
                  .slideY(
                    begin: 0.2,
                    end: 0,
                    duration: taglineDuration,
                    curve: Curves.easeOutCubic,
                  )
                  .scaleXY(
                    begin: 0.95,
                    end: 1,
                    duration: taglineDuration,
                  ),
                ),
                
                AddHeight(0.05),
                // Staggered options with bounce effect
                Column(
                  children: [
                    CircularFindContainer(
                      onTap: () {},
                      title: 'Orthodox',
                    )
                    .animate(delay: optionsDelay)
                    .fadeIn(duration: optionsDuration)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: optionsDuration,
                      curve: Curves.easeOutBack,
                    )
                    .scaleXY(
                      begin: 0.9,
                      end: 1,
                      curve: Curves.easeOutBack,
                    ),
                    
                    AddHeight(0.01),
                    
                    CircularFindContainer(
                      onTap: () {},
                      title: 'Anglican',
                    )
                    .animate(delay: optionsDelay + staggerDelay)
                    .fadeIn(duration: optionsDuration)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: optionsDuration,
                      curve: Curves.easeOutBack,
                    )
                    .scaleXY(
                      begin: 0.9,
                      end: 1,
                      curve: Curves.easeOutBack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      
      // Next button with pulse effect
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
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
                      const IntroScriptureScreen(),
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
                    color: DesignConstants.kTextGreenColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),)
                ],
              ),
              child: Text( 
                'Next',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
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
      )
      .animate(delay: bottomElementsDelay)
      .fadeIn(duration: bottomElementsDuration, curve: Curves.easeOut)
      .slideY(
        begin: 0.4,
        end: 0,
        duration: bottomElementsDuration,
        curve: Curves.easeOut,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}