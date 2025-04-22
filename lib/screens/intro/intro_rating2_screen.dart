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

class IntroRating2Screen extends StatelessWidget {
  const IntroRating2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final bottomElementsDelay = taglineDelay + taglineDuration * 0.5;
    final bottomElementsDuration = 700.ms;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        // padding: EdgeInsets.symmetric(
        //   horizontal: DataConstants.kScreenHorizontalPadding,
        // ),
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
                  .fadeIn(duration: logoDuration, curve: Curves.easeOut)
                  .slideY(
                    begin: -0.2,
                    end: 0,
                    duration: logoDuration,
                    curve: Curves.easeOut,
                  )
                  // Add a subtle continuous animation after entrance
                  .then(delay: 300.ms) // Wait a bit after entrance
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
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                      imagePath: AppImages.ratingImageIconGlory,
                      fit: BoxFit.fitHeight,
                    )
                    .animate(
                      delay: taglineDelay,
                    ) // Start after logo starts fading in
                    .fadeIn(duration: taglineDuration, curve: Curves.easeOut)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: taglineDuration,
                      curve: Curves.easeOut,
                    ),
              ),
              AddHeight(0.05),
            
              AddHeight(0.03),

              SizedBox(
                height: height * 0.5,
                child: Stack(
                  children: [
                    CarouselSlider(
                      disableGesture: true,
                      options: CarouselOptions(
                        height: height * 0.5,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.5,
                        
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
                        scrollDirection: Axis.vertical,
                      ),
                      items:
                          [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Card(
                                      color: Colors.white,
                                      shadowColor:
                                          DesignConstants.kTextLightColor,
                                      elevation: 5.0,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  size: 30.0,
                                                ),
                                                SizedBox(width: 3),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  size: 30.0,
                                                ),
                                                SizedBox(width: 3),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  size: 30.0,
                                                ),
                                                SizedBox(width: 3),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  size: 30.0,
                                                ),
                                                SizedBox(width: 3),
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  size: 30.0,
                                                ),
                                              ],
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
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            
                            RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextLightColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: GloryAiAssetImage(
                                  imagePath: AppImages.rightArrowIcon,
                                ),
                              ),
                            ),
                            AddHeight(0.025)
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
              GestureDetector(
                // In IntroScreen, modify the GestureDetector's onTap:
                onTap: () {
                  // final RenderBox button =
                  //     context.findRenderObject() as RenderBox;
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
                  //     pageBuilder:
                  //         (context, animation, secondaryAnimation) =>
                  //             const IntroQuoteScreen(),
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
                  ),
                  child: Text(
                    'Proceed',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AddHeight(0.015),
              AddHeight(0.015),
            ],
          )
          .animate(
            delay: bottomElementsDelay,
          ) // Start after tagline starts animating
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
