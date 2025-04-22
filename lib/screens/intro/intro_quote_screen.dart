import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/screens/intro/intro_where_find_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroQuoteScreen extends StatelessWidget {
  const IntroQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);

    // Animation timing constants
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final textDelay = taglineDelay + taglineDuration;
    final textDuration = 1000.ms;
    final imageDelay = textDelay + textDuration * 0.5;
    final imageDuration = 800.ms;
    final bottomElementsDelay = imageDelay + imageDuration * 0.5;
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
          child: SingleChildScrollView(
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
                    .fadeIn(duration: logoDuration, curve: Curves.easeOutQuint)
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
                AddHeight(0.03),
                // Eye icon with polished animation
                SizedBox(
                  height: height * 0.05,
                  width: double.maxFinite,
                  child: GloryAiAssetImage(
                        imagePath: AppImages.eyeIcon,
                        fit: BoxFit.fitHeight,
                      )
                      .animate(delay: taglineDelay)
                      .fadeIn(
                        duration: taglineDuration,
                        curve: Curves.easeOutQuint,
                      )
                      .scaleXY(
                        begin: 0.8,
                        end: 1,
                        duration: taglineDuration,
                        curve: Curves.easeOutBack,
                      )
                      .then()
                      .animate(onPlay: (controller) => controller.repeat())
                      .shake(
                        hz: 1,
                        offset: const Offset(0, 2),
                        duration: 3000.ms,
                        delay: 2000.ms,
                      ),
                ),
                AddHeight(0.02),
                // Animated text with professional reveal
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  child: Animate(
                    effects: [
                      FadeEffect(
                        delay: textDelay,
                        duration: textDuration,
                        curve: Curves.easeOutQuint,
                      ),
                      SlideEffect(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                        delay: textDelay,
                        duration: textDuration,
                        curve: Curves.easeOutQuint,
                      ),
                    ],
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                      child: Column(
                        children: [
                          _buildAnimatedTextLine(
                            'This is an entirely',
                            textDelay,
                          ),
                          _buildAnimatedTextLine(
                            'anonymous place',
                            textDelay + 100.ms,
                          ),
                          _buildAnimatedTextLine(
                            'for your faith journey',
                            textDelay + 200.ms,
                          ),
                          const SizedBox(height: 16),
                          _buildAnimatedTextLine(
                            'No names, no profiles',
                            textDelay + 300.ms,
                          ),
                          _buildAnimatedTextLine(
                            '- just genuine spiritual',
                            textDelay + 400.ms,
                          ),
                          _buildAnimatedTextLine(
                            'connection.',
                            textDelay + 500.ms,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Messiah Icon with professional animation
                SizedBox(
                  height: height * 0.35,
                  child: GloryAiAssetImage(
                        imagePath: AppImages.messiahIconGlory,
                      )
                      .animate(delay: imageDelay)
                      .fadeIn(duration: imageDuration)
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1, 1),
                        duration: imageDuration,
                        curve: Curves.easeOutBack,
                      )
                      .moveY(
                        begin: -5,
                        end: 5,
                        duration: 4000.ms,
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
          // Next Button with professional animations
          MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
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
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                const IntroWhereFindScreen(),
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
                          color: DesignConstants.kTextGreenColor.withOpacity(
                            0.3,
                          ),
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
                          'Next',
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

  Widget _buildAnimatedTextLine(String text, Duration delay) {
    return Animate(
      effects: [
        FadeEffect(delay: delay, duration: 500.ms, curve: Curves.easeOut),
        SlideEffect(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
          delay: delay,
          duration: 600.ms,
          curve: Curves.easeOutQuint,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(text),
      ),
    );
  }
}
