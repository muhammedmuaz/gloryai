import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/intro/intro_beginning_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroLovingGodScreen extends StatelessWidget {
  const IntroLovingGodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing control
    final logoDuration = 800.ms;
    final titleDelay = logoDuration * 0.5;
    final titleDuration = 600.ms;
    final prayerDelay = titleDelay + titleDuration;
    final prayerDuration = 1000.ms;
    final shareButtonDelay = prayerDelay + prayerDuration * 0.5;
    final shareButtonDuration = 500.ms;
    final bottomElementsDelay = shareButtonDelay + shareButtonDuration;
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

                  AddHeight(0.08),
                  // Title with elegant entrance
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Loving God',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    )
                    .animate(delay: titleDelay)
                    .fadeIn(duration: titleDuration, curve: Curves.easeOutCubic)
                    .slideY(
                      begin: 0.2,
                      end: 0,
                      duration: titleDuration,
                      curve: Curves.easeOutCubic,
                    )
                    .blur(
                      begin: const Offset(4, 0),
                      end: const Offset(0, 0),
                      duration: titleDuration,
                    ),
                  ),

                  AddHeight(0.02),
                  // Prayer text with sequential reveal
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'In this moment of challenges, I come to\nYou seeking strength. You know what\nI face, the burdens on my heart, and the\ntrials that feel overwhelming.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        )
                        .animate(delay: prayerDelay)
                        .fadeIn(duration: prayerDuration * 0.3)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: prayerDuration * 0.3,
                        ),
                        
                        Text(
                          '\nGrant me the courage to move forward,\nthe wisdom to make good decisions, and\nthe faith to trust that I am never alone.\nRenew my strength, Lord,\nand fill my spirit with hope',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        )
                        .animate(delay: prayerDelay + 300.ms)
                        .fadeIn(duration: prayerDuration * 0.3)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: prayerDuration * 0.3,
                        ),
                        
                        Text(
                          '\n\nThank You for walking with me\nevery step of the way.\nAmen.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        )
                        .animate(delay: prayerDelay + 600.ms)
                        .fadeIn(duration: prayerDuration * 0.4)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: prayerDuration * 0.4,
                        ),
                      ],
                    ),
                  ),

                  AddHeight(0.05),
                  // Share button with attention-grabbing animation
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
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(Icons.share, color: Colors.white),
                  )
                  .animate(delay: shareButtonDelay)
                  .scaleXY(
                    begin: 0,
                    end: 1,
                    duration: shareButtonDuration,
                    curve: Curves.elasticOut,
                  )
                  .fadeIn(duration: shareButtonDuration)
                  .then()
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .shake(
                    hz: 0.5,
                    // amount: 0.5,
                    duration: 2000.ms,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
      // Amen button with enhanced animations
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
                      const IntroBeginningScreen(),
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
                    'Amen',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.favorite, color: Colors.white, size: 22)
                    .animate(onPlay: (controller) => controller.repeat())
                    .scaleXY(
                      begin: 1,
                      end: 1.2,
                      duration: 1000.ms,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scaleXY(
                      begin: 1.2,
                      end: 1,
                      duration: 1000.ms,
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
}