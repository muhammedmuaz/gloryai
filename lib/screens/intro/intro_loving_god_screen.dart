import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class IntroLovingGodScreen extends StatelessWidget {
  const IntroLovingGodScreen({super.key});

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
          child: ScreenPadding(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddHeight(0.05),
                  SizedBox(
                    width: width * 0.6,
                    child: GloryAiAssetImage(imagePath: AppImages.applogo),
                  ),
                  AddHeight(0.08),
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
                    ),
                  ),
                  AddHeight(0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                      
                      AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'In this moment of challenges, I come to you seeking strength. You know what I face, the burdens on my heart, and the trials that feel overwhelming.\n\n Grant me the courage to move forward, the wisdom to make good decisions, and the faith to trust that I am never alone. Renew my strength, Lord, and fill my spirit with hope.\n\nThank You for walking with me every step of the way. Amen.',
                              textAlign: TextAlign.center,
                              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextPurpleColor,
                              ),
                              speed: 10.milliseconds,
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                        ),
                      
                      
                      ],
                    ),
                  ),
                  AddHeight(0.05),
                  GestureDetector(
                    onTap: (){
                      BottomSheetsAndDialogs.shareDialogBox(
                context,
                onShare: () {
                  AppNavigation.goBack();
                },
                onCancel: () {
                  AppNavigation.goBack();
                },
              );
                    },
                    child: Container(
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
                    ),
                  ),
                  AddHeight(0.12),
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
              BottomSheetsAndDialogs.shareDialogBox(
                context,
                onShare: () {
                  AppNavigation.navigateTo(AppRoutesNames.introBeginningScreen);
                },
                onCancel: () {
                  AppNavigation.navigateTo(AppRoutesNames.introBeginningScreen);
                },
              );
            },
            child: Container(
              width: width,
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
                    color: DesignConstants.kTextGreenColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 0,
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
                    'Amen',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
