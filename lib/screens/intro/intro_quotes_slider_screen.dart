import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/screens/intro/intro_loving_god_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroQuotesSliderScreen extends StatelessWidget {
  const IntroQuotesSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    
    // Animation timing control
    final logoDuration = 800.ms;
    final titleDelay = logoDuration * 0.5;
    final titleDuration = 600.ms;
    final quoteDelay = titleDelay + titleDuration;
    final quoteDuration = 500.ms;
    final counterDelay = quoteDelay + quoteDuration * 0.5;
    final counterDuration = 300.ms;
    final carouselDelay = counterDelay + counterDuration;
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
              // Title with elegant entrance
              Text(
                'Let\'s experience\nthe power\nof prayer together.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  height: 1.3,
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

              AddHeight(0.01),
              // Quote with pop-in effect
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21.0),
                  border: Border.all(color: DesignConstants.kTextGreenColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Strength to overcome challenges.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
              )
              .animate(delay: quoteDelay)
              .scaleXY(
                begin: 0.9,
                end: 1,
                duration: quoteDuration,
                curve: Curves.elasticOut,
              )
              .fadeIn(duration: quoteDuration),

              AddHeight(0.01),
              // Counter with fade and slide
              Text(
                '36/140',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextGreenColor,
                  fontStyle: FontStyle.italic,
                ),
              )
              .animate(delay: counterDelay)
              .fadeIn(duration: counterDuration)
              .slideY(
                begin: 0.1,
                end: 0,
                duration: counterDuration,
              ),

              AddHeight(0.01),
              // Carousel with enhanced animations
              SizedBox(
                height: height * 0.335,
                child: Stack(
                  children: [
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
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        onPageChanged: (s, f) {},
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
                                margin: EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(21.0),
                                  child: Text(
                                    'Strength to\novercome\nchallenges.',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                ),
                              )
                              .animate(delay: carouselDelay)
                              .fadeIn(duration: carouselDuration)
                              .scaleXY(
                                begin: 0.95,
                                end: 1,
                                duration: carouselDuration,
                                curve: Curves.easeOutBack,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left arrow with bounce effect
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: GloryAiAssetImage(
                                imagePath: AppImages.leftArrowIcon,
                              ),
                            )
                            .animate(delay: carouselDelay + 100.ms)
                            .scaleXY(
                              begin: 0,
                              end: 1,
                              duration: 500.ms,
                              curve: Curves.elasticOut,
                            ),
                            
                            // Right arrow with bounce effect
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: GloryAiAssetImage(
                                imagePath: AppImages.rightArrowIcon,
                              ),
                            )
                            .animate(delay: carouselDelay + 200.ms)
                            .scaleXY(
                              begin: 0,
                              end: 1,
                              duration: 500.ms,
                              curve: Curves.elasticOut,
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
      
      // Button with enhanced animations
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
                      const IntroLovingGodScreen(),
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
                    'Receive my prayer',
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