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

class IntroAlwaysTogetherScreen extends StatelessWidget {
  const IntroAlwaysTogetherScreen({super.key});

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
                  ),
                ),

                AddHeight(0.01),
                // Subtitle with animation
                Text(
                  'Witness how your community supports one another',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
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
                          viewportFraction: 0.74,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(
                            milliseconds: 800,
                          ),
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
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 8,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Date text with animation
                                            Text(
                                              '1 day ago',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    DesignConstants
                                                        .kTextLightColor,
                                              ),
                                            ),

                                            AddHeight(0.01),
                                            // Quote icon with animation
                                            SizedBox(
                                              height: 34,
                                              width: 34,
                                              child: GloryAiAssetImage(
                                                imagePath: AppImages.quoteIcon,
                                              ),
                                            ),
                                            AddHeight(0.01),
                                            // Quote text with animation
                                            Text(
                                              'With all my being, I ask that our loving Heavenly Father brings about a wonderful miracle in your mother\'s journey.',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                            ),
                                            AddHeight(0.01),
                                            // Like button with animation
                                            Container(
                                              height: 40,
                                              width: 65,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12.0,
                                                  ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                border: Border.all(
                                                  color:
                                                      DesignConstants
                                                          .kTextLightColor,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GloryAiAssetImage(
                                                    imagePath:
                                                        AppImages.heartIcon,
                                                  ),
                                                  Text(
                                                    '5',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              DesignConstants
                                                                  .kTextPurpleColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AddHeight(0.12),
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
          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(
              AppRoutesNames.introHowLongistScreen
              );
              
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
