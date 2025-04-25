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

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing constants
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final imageDelay = taglineDelay + taglineDuration;
    final imageDuration = 800.ms;
    final bottomElementsDelay = imageDelay + imageDuration * 0.5;
    final bottomElementsDuration = 700.ms;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: DataConstants.kScreenHorizontalPadding,
        ),
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
              // --- Animated Logo ---
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

              AddHeight(0.06),
              // Tagline Text
              Text(
                '",,Divine Wisdom, Daily"',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),)
                  ],
                ),
              )
              .animate(delay: taglineDelay)
              .fadeIn(
                duration: taglineDuration,
                curve: Curves.easeOutQuint,
              )
              .slideY(
                begin: 0.3,
                end: 0,
                duration: taglineDuration,
                curve: Curves.easeOutBack,
              )
              .blur(
                begin: const Offset(4, 0),
                end: const Offset(0, 0),
                duration: taglineDuration,
              ),
              
              // Main Image with enhanced animation
              SizedBox(
                height: height * 0.5,
                child: GloryAiAssetImage(imagePath: AppImages.introIcon)
                .animate(delay: imageDelay)
                .fadeIn(duration: imageDuration)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: imageDuration,
                  curve: Curves.easeOutBack,
                )
                .custom(
                  begin: 0,
                  end: 1,
                  builder: (_, value, child) {
                    return Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    );
                  },
                ),
              ),
           
           
           AddHeight(0.2),
            ],
          ),
        ),
      ),
      // --- Animated Bottom Elements ---
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Proceed Button with enhanced animations
          GestureDetector(
            onTap: () {


              AppNavigation.navigateTo(AppRoutesNames.introRatingScreen);
              // final RenderBox button = context.findRenderObject() as RenderBox;
              // final buttonPosition = button.localToGlobal(Offset.zero);
              // final buttonSize = button.size;
              // final buttonCenter = Offset(
              //   buttonPosition.dx + buttonSize.width / 2,
              //   buttonPosition.dy + buttonSize.height / 2,
              // );

              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     transitionDuration: const Duration(milliseconds: 800),
              //     pageBuilder: (context, animation, secondaryAnimation) =>
              //         const IntroRatingScreen(),
              //     transitionsBuilder: (
              //       context,
              //       animation,
              //       secondaryAnimation,
              //       child,
              //     ) {
              //       return ClipPath(
              //         clipper: CircleRevealClipper(
              //           fraction: animation.value,
              //           center: buttonCenter,
              //         ),
              //         child: child,
              //       );
              //     },
              //   ),
              // );
      
      
            },
            child:AnimatedContainer(
                duration: 300.ms,
                height: 55,
                width: width,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: DesignConstants.kShilo,
                  boxShadow: [
                    BoxShadow(
                      color: DesignConstants.kShilo.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      DesignConstants.kShilo,
                      DesignConstants.kShilo.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
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
          ),
          AddHeight(0.015),
          // Login Text with refined animation
          GestureDetector(
            onTap:(){
              AppNavigation.navigateTo(AppRoutesNames.introLoginScreen);
            },
            child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: DesignConstants.kTextPurpleColor.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' Log in',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: DesignConstants.kTextPurpleColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              )
              .animate(delay: bottomElementsDelay + 100.ms)
              .fadeIn(duration: 500.ms)
              .slideY(
                begin: 0.2,
                end: 0,
                duration: 500.ms,
              ),
          ),
          AddHeight(0.015),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}