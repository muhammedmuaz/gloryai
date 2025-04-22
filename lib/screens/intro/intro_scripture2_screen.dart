import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/intro/intro_demo_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroScripture2Screen extends StatelessWidget {
  const IntroScripture2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing control
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final subtitleDelay = taglineDelay + taglineDuration * 0.5;
    final subtitleDuration = 500.ms;
    final featureDelay = subtitleDelay + subtitleDuration;
    final featureStagger = 300.ms;
    final featureDuration = 600.ms;
    final bottomElementsDelay = featureDelay + (featureStagger * 3);
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddHeight(0.05),
                  // Logo with enhanced animations
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
                  // Main tagline with attention-grabbing animation
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Transform Scripture\ninto Conversation',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                        height: 1.3,
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
                    .blur(
                      begin: const Offset(4, 0),
                      end: const Offset(0, 0),
                      duration: taglineDuration,
                    ),
                  ),
                  
                  // Subtitle with delayed entrance
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Your daily time with God\nthrough meaningful conversation',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                        height: 1.4,
                      ),
                    )
                    .animate(delay: subtitleDelay)
                    .fadeIn(duration: subtitleDuration)
                    .slideY(
                      begin: 0.1,
                      end: 0,
                      duration: subtitleDuration,
                    ),
                  ),

                  AddHeight(0.05),
                  
                  // Feature 1 with staggered animation
                  _buildFeatureItem(
                    context: context,
                    number: '1',
                    title: 'Lasting Impact',
                    description: 'Take away insights,\nreflections, and action steps.',
                    delay: featureDelay,
                    duration: featureDuration,
                  ),
                  
                  AddHeight(0.05),
                  
                  // Feature 2 with staggered animation
                  _buildFeatureItem(
                    context: context,
                    number: '2',
                    title: 'Personal Journey',
                    description: 'Conversations that grow\nwith your faith walk.',
                    delay: featureDelay + featureStagger,
                    duration: featureDuration,
                  ),
                  
                  AddHeight(0.05),
                  
                  // Feature 3 with staggered animation
                  _buildFeatureItem(
                    context: context,
                    number: '3',
                    title: 'Daily Dedication',
                    description: 'Build lasting habits\nwith 5-10 minutes of reflection.',
                    delay: featureDelay + (featureStagger * 2),
                    duration: featureDuration,
                  ),
                  
                  AddHeight(0.1), // Extra space at bottom
                ],
              ),
            ),
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
                      const IntroDemoScreen(),
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
                    offset: const Offset(0, 4),
                  )
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
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 22)
                    .animate(onPlay: (controller) => controller.repeat())
                    .moveX(begin: -2, end: 2, duration: 1000.ms, curve: Curves.easeInOut)
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
      )
      .animate(delay: bottomElementsDelay)
      .fadeIn(duration: bottomElementsDuration, curve: Curves.easeOut)
      .slideY(
        begin: 0.4,
        end: 0,
        duration: bottomElementsDuration,
        curve: Curves.easeOutBack,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Helper method to build animated feature items
  Widget _buildFeatureItem({
    required BuildContext context,
    required String number,
    required String title,
    required String description,
    required Duration delay,
    required Duration duration,
  }) {
    return Column(
      children: [
        // Number badge with bounce effect
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: DesignConstants.kBlossom,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: DesignConstants.kBlossom.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            '$number.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        )
        .animate(delay: delay)
        .scaleXY(
          begin: 0,
          end: 1,
          duration: duration,
          curve: Curves.elasticOut,
        )
        .fadeIn(duration: duration),
        
        AddHeight(0.01),
        
        // Title with slide and fade
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DataConstants.kScreenHorizontalPadding,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: DesignConstants.kTextPurpleColor,
            ),
          )
          .animate(delay: delay + 100.ms)
          .fadeIn(duration: duration)
          .slideY(
            begin: 0.2,
            end: 0,
            duration: duration,
            curve: Curves.easeOutCubic,
          ),
        ),
        
        // Description with delayed entrance
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DataConstants.kScreenHorizontalPadding,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: DesignConstants.kTextPurpleColor,
              height: 1.4,
            ),
          )
          .animate(delay: delay + 200.ms)
          .fadeIn(duration: duration)
          .slideY(
            begin: 0.1,
            end: 0,
            duration: duration,
          ),
        ),
      ],
    );
  }
}