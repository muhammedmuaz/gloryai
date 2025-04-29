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

class IntroRating2Screen extends StatefulWidget {
  const IntroRating2Screen({super.key});

  @override
  State<IntroRating2Screen> createState() => _IntroRating2ScreenState();
}

class _IntroRating2ScreenState extends State<IntroRating2Screen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
   
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
              AddHeight(0.03),
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                      imagePath: AppImages.ratingImageIconGlory,
                      fit: BoxFit.fitHeight,
                    )
                   
           
              ),
              AddHeight(0.03),
              Expanded(
                child: Stack(
                  children: [
                    CarouselSlider(
                      disableGesture: true,
                      controller: _carouselController,
                      options: CarouselOptions(
                        height: height * 0.58,
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
                            
                            GestureDetector(
                              onTap: (){
                                _carouselController.nextPage();
                              },
                              child: RotatedBox(
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
                            ),
                            AddHeight(0.02)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AddHeight(0.1)
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
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0),

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
                        'Proceed',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                )
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
   
   
      ],
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
