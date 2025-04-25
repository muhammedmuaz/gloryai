import 'package:carousel_slider_plus/carousel_slider_plus.dart';
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

class IntroRating2Screen extends StatelessWidget {
  const IntroRating2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final mockupDuration = 800.ms;
    final logoDuration = 800.ms;
    final titleDelay = logoDuration * 0.5;
    final titleDuration = 600.ms;
    final subtitleDelay = titleDelay + titleDuration * 0.5;
    final subtitleDuration = 500.ms;
    final mockupDelay = subtitleDelay + subtitleDuration;
    final bottomElementsDelay = mockupDelay + mockupDuration * 0.5;

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
              SizedBox(
                    width: width * 0.6,
                    child: GloryAiAssetImage(imagePath: AppImages.applogo),
                  )
                  ,
              AddHeight(0.05),
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                      imagePath: AppImages.ratingImageIconGlory,
                      fit: BoxFit.fitHeight,
                    )
                   
           
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
                            AddHeight(0.04)
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
                onTap: () {
                AppNavigation.navigateTo(AppRoutesNames.introIlluminateSpiritScreen);
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
                ).animate(
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
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
