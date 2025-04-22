import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/screens/intro/intro_gender_select_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroAlwaysTogetherScreen extends StatelessWidget {
  const IntroAlwaysTogetherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing constants
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final carouselDelay = taglineDelay + taglineDuration;
    final carouselDuration = 800.ms;
    final bottomElementsDelay = carouselDelay + carouselDuration * 0.5;
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
              ),

              AddHeight(0.05),
              // Title with polished animation
              Text(
                'Always Together',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
              )
              .animate(delay: taglineDelay)
              .fadeIn(duration: taglineDuration)
              .slideY(
                begin: 0.2,
                end: 0,
                duration: taglineDuration,
                curve: Curves.easeOutBack,
              ),

              AddHeight(0.01),
              // Subtitle with animation
              Text(
                'Witness how your community\nsupports one another',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              )
              .animate(delay: taglineDelay + 100.ms)
              .fadeIn(duration: taglineDuration)
              .slideY(
                begin: 0.1,
                end: 0,
                duration: taglineDuration,
              ),

              AddHeight(0.08),
              // Carousel with enhanced animations
              SizedBox(
                height: height * 0.36,
                child: Stack(
                  children: [
                    CarouselSlider(
                      disableGesture: true,
                      options: CarouselOptions(
                        height: height * 0.435,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.67,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: 3.seconds,
                        autoPlayAnimationDuration: 800.ms,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: double.maxFinite,
                              child: Card(
                                color: Colors.white,
                                shadowColor: DesignConstants.kTextLightColor,
                                elevation: 5.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Date text with animation
                                      Text(
                                        '1 day ago',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                          color: DesignConstants.kTextLightColor,
                                        ),
                                      )
                                      .animate(delay: 100.ms)
                                      .fadeIn(duration: 300.ms)
                                      .slideY(
                                        begin: 0.1,
                                        end: 0,
                                        duration: 300.ms,
                                      ),
                                      
                                      AddHeight(0.01),
                                      // Quote icon with animation
                                      SizedBox(
                                        height: 34,
                                        width: 34,
                                        child: GloryAiAssetImage(
                                          imagePath: AppImages.quoteIcon,
                                        )
                                        .animate(delay: 200.ms)
                                        .scale(
                                          begin: const Offset(0.5, 0.5),
                                          end: const Offset(1, 1),
                                          duration: 400.ms,
                                          curve: Curves.elasticOut,
                                        ),
                                      ),
                                      AddHeight(0.01),
                                      // Quote text with animation
                                      Text(
                                        'With all my being,\nI ask that our loving\nHeavenly Father brings\nabout a wonderful\nmiracle in your\nmother\'s journey.',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: DesignConstants.kTextPurpleColor,
                                        ),
                                      )
                                      .animate(delay: 300.ms)
                                      .fadeIn(duration: 500.ms)
                                      .slideY(
                                        begin: 0.2,
                                        end: 0,
                                        duration: 500.ms,
                                      ),
                                      AddHeight(0.01),
                                      // Like button with animation
                                      Container(
                                        height: 45,
                                        width: 75,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18.0),
                                          border: Border.all(
                                            color: DesignConstants.kTextLightColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GloryAiAssetImage(
                                              imagePath: AppImages.heartIcon,
                                            )
                                            .animate(delay: 400.ms)
                                            .scale(
                                              begin: const Offset(0.8, 0.8),
                                              end: const Offset(1, 1),
                                              duration: 400.ms,
                                              curve: Curves.elasticOut,
                                            ),
                                            Text(
                                              '5',
                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: DesignConstants.kTextPurpleColor,
                                              ),
                                            )
                                            .animate(delay: 500.ms)
                                            .scale(
                                              begin: const Offset(0.8, 0.8),
                                              end: const Offset(1, 1),
                                              duration: 400.ms,
                                              curve: Curves.elasticOut,
                                            ),
                                          ],
                                        ),
                                      )
                                      .animate(delay: 400.ms)
                                      .fadeIn(duration: 500.ms),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                    .animate(delay: carouselDelay)
                    .fadeIn(duration: carouselDuration)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: carouselDuration,
                      curve: Curves.easeOutQuint,
                    ),
                    // Navigation arrow with animation
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: GloryAiAssetImage(
                                imagePath: AppImages.rightArrowIcon,
                              )
                              .animate(delay: carouselDelay + 200.ms)
                              .fadeIn(duration: 400.ms)
                              .scale(
                                begin: const Offset(0.7, 0.7),
                                end: const Offset(1, 1),
                                duration: 500.ms,
                                curve: Curves.elasticOut,
                              )
                              .then()
                              .animate(onPlay: (controller) => controller.repeat())
                              .shake(
                                hz: 1,
                                offset: const Offset(2, 0),
                                duration: 3000.ms,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                        const IntroGenderSelectScreen(),
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
                      'Proceed',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 24)
                      .animate(
                        delay: bottomElementsDelay + 200.ms,
                        onPlay: (controller) => controller.repeat(),
                      )
                      .slideX(
                        begin: 0,
                        end: 4,
                        duration: 1000.ms,
                        curve: Curves.easeInOut,
                      )
                      .then(delay: 500.ms)
                      .slideX(
                        begin: -4,
                        end: 0,
                        duration: 1000.ms,
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
}