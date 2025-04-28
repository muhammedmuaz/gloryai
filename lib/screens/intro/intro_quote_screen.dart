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

class IntroQuoteScreen extends StatelessWidget {
  const IntroQuoteScreen({super.key});

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
              ),
              AddHeight(0.03),
              SizedBox(
                height: height * 0.05,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                  imagePath: AppImages.eyeIcon,
                  fit: BoxFit.fitHeight,
                ),
              ),
              AddHeight(0.02),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                child: Text(
                  "This is an entirely anonymous place for your faith journey",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AddHeight(0.01),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                child: Text(
                  "No names, no profiles - just genuine spiritual connection.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Messiah Icon
              Expanded(
                // height: height * 0.,.
                child: GloryAiAssetImage(imagePath: AppImages.messiahIconGlory),
              ),
              SizedBox(height: height * 0.13),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(AppRoutesNames.introWhereFindScreen);
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
                        'Next',
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
