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

class IntroQuotesSliderScreen extends StatefulWidget {
  const IntroQuotesSliderScreen({super.key});

  @override
  State<IntroQuotesSliderScreen> createState() =>
      _IntroQuotesSliderScreenState();
}

class _IntroQuotesSliderScreenState extends State<IntroQuotesSliderScreen>{
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  String selectedText = 'Strength to overcome challenges.';

  List<String> questions = [
    'The strength to push through life\'s most difficult obstacles and emerge victorious.',
    'The courage to face your deepest fears and step boldly into the unknown.',
    'The resilience to rise stronger every time life knocks you down.',
    'The determination to keep chasing your dreams no matter how far they seem.',
    'The patience to trust the journey and grow through every struggle.',
    'The perseverance to keep moving forward when everything feels against you.',
    'The hope to find light even in the darkest moments of life.',
    'The discipline to stay focused and consistent when motivation fades.',
    'The kindness to heal hearts and uplift others along the way.',
  ];


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
              // Logo with enhanced animations
              SizedBox(
                width: width * 0.6,
                child: GloryAiAssetImage(imagePath: AppImages.applogo),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      child: Text(
                        'Let\'s experience the power of prayer together.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                          height: 1.3,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                    AddHeight(0.03),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21.0),
                        border: Border.all(
                          color: DesignConstants.kTextGreenColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        selectedText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),

                    AddHeight(0.03),
                    SizedBox(
                      height: height * 0.3,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            disableGesture: true,
                            controller: _carouselController,
                            options: CarouselOptions(
                              height: height * 0.335,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.67,
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
                              onPageChanged: (s, f) {},
                              scrollDirection: Axis.horizontal,
                            ),
                            items:
                                questions.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        width: double.maxFinite,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedText = i;
                                            });
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            shadowColor:
                                                DesignConstants.kTextLightColor,
                                            elevation: 5.0,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 12.0,
                                              vertical: 8.0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(21.0),
                                              child: Text(
                                                i,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DesignConstants
                                                              .kTextPurpleColor,
                                                    ),
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
                                horizontal:
                                    DataConstants.kScreenHorizontalPadding,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left arrow with bounce effect
                                  GestureDetector(
                                    onTap: () {
                                      _carouselController.previousPage();
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: DesignConstants.kTextLightColor,
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                          onTap: () {
                                            _carouselController.previousPage();
                                          },
                                          child: GloryAiAssetImage(
                                            imagePath: AppImages.leftArrowIcon,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _carouselController.nextPage();
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: DesignConstants.kTextLightColor,
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: GloryAiAssetImage(
                                        imagePath: AppImages.rightArrowIcon,
                                      ),
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
              AddHeight(0.12),
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
              AppNavigation.navigateTo(AppRoutesNames.introLovingGodScreen);
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
