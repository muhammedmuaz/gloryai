import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/screens/intro/intro_quote_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroRatingScreen extends StatelessWidget {
  const IntroRatingScreen({super.key});

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
    final bottomElementsDuration = 800.ms;

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
              // --- Animated Logo ---
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
              AddHeight(0.05),
              // Rating Icon
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                      imagePath: AppImages.appRatingIcon,
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
                    ),
              ),
              AddHeight(0.05),
              // Testimonials Text
              Text(
                    'Testimonials',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextLightColor,
                    ),
                  )
                  .animate(delay: taglineDelay + 100.ms)
                  .fadeIn(duration: taglineDuration)
                  .slideY(
                    begin: 0.2,
                    end: 0,
                    duration: taglineDuration,
                    curve: Curves.easeOutQuint,
                  )
                  .blur(
                    begin: const Offset(4, 0),
                    end: const Offset(0, 0),
                    duration: taglineDuration,
                  ),
              AddHeight(0.03),
              // Carousel Section
              SizedBox(
                height: height * 0.335,
                child: Stack(
                  children: [
                    // Carousel with refined animations
                    CarouselSlider(
                          disableGesture: true,
                          options: CarouselOptions(
                            height: height * 0.335,
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
                          items:
                              [1, 2, 3, 4, 5].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      width: double.maxFinite,
                                      child: Card(
                                        color: Colors.white,
                                        shadowColor:
                                            DesignConstants.kTextLightColor,
                                        elevation: 5.0,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // Stars with refined animation
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: List.generate(5, (
                                                    index,
                                                  ) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 3,
                                                          ),
                                                      child: Icon(
                                                            Icons.star,
                                                            color:
                                                                DesignConstants
                                                                    .kTextLightColor,
                                                            size: 30.0,
                                                          )
                                                          .animate(
                                                            delay:
                                                                (200.ms * i) +
                                                                (50.ms * index),
                                                          )
                                                          .scale(
                                                            begin: const Offset(
                                                              0,
                                                              0,
                                                            ),
                                                            end: const Offset(
                                                              1,
                                                              1,
                                                            ),
                                                            duration: 500.ms,
                                                            curve:
                                                                Curves
                                                                    .elasticOut,
                                                          )
                                                          .custom(
                                                            begin: 0,
                                                            end: 1,
                                                            builder: (
                                                              _,
                                                              value,
                                                              child,
                                                            ) {
                                                              return Transform.rotate(
                                                                angle:
                                                                    value *
                                                                    0.2 *
                                                                    (1 - value),
                                                                child: child,
                                                              );
                                                            },
                                                          ),
                                                    );
                                                  }),
                                                ),
                                                // Optional: Add testimonial text with animation
                                                if (i.isOdd)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 12,
                                                        ),
                                                    child: Text(
                                                          'Excellent service!',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        )
                                                        .animate(
                                                          delay:
                                                              (200.ms * i) +
                                                              300.ms,
                                                        )
                                                        .fadeIn(
                                                          duration: 400.ms,
                                                        )
                                                        .slideY(
                                                          begin: 0.2,
                                                          end: 0,
                                                          duration: 400.ms,
                                                        ),
                                                  ),
                                              ],
                                            ),
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
                    // Navigation Arrows
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Arrow with refined animation
                            _buildArrowButton(
                              context,
                              icon: AppImages.leftArrowIcon,
                              delay: carouselDelay + 200.ms,
                              isLeft: true,
                            ),
                            // Right Arrow with refined animation
                            _buildArrowButton(
                              context,
                              icon: AppImages.rightArrowIcon,
                              delay: carouselDelay + 300.ms,
                              isLeft: false,
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
      // --- Animated Bottom Elements ---
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Proceed Button with enhanced animations
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
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          const IntroQuoteScreen(),
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
          AddHeight(0.015),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildArrowButton(
    BuildContext context, {
    required String icon,
    required Duration delay,
    required bool isLeft,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
            duration: 300.ms,
            curve: Curves.easeOut,
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GloryAiAssetImage(imagePath: icon),
                ),
              ),
            ),
          )
          .animate(delay: delay)
          .fadeIn(duration: 400.ms)
          .scale(
            begin: const Offset(0.7, 0.7),
            end: const Offset(1, 1),
            duration: 600.ms,
            curve: Curves.elasticOut,
          )
          .then()
          .animate(onPlay: (controller) => controller.repeat())
          .shake(hz: 2, duration: 2000.ms, delay: 2000.ms),
    );
  }
}