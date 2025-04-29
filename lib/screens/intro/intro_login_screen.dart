import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroLoginScreen extends StatelessWidget {
  const IntroLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: Column(
              children: [
                AddHeight(0.05),
                SizedBox(
                  width: width * 0.6,
                  child: GloryAiAssetImage(imagePath: AppImages.applogo),
                ),
                AddHeight(0.03),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Tagline with attention-grabbing animation
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Text(
                          'Secure Your Spirit Journey',
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                      ),
                      AddHeight(0.1),
                      // For Apple Sign In
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.black,
                          ),
                          child: Stack(
                            children: [
                              // Icon aligned to the left
                              Positioned(
                                left: 14.0,
                                top: 10,
                                child: Icon(
                                  Icons.apple,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              // Centered text
                              Center(
                                child: Text(
                                  'Sign in with Apple',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AddHeight(0.01),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: DesignConstants.kFbBtnColor,
                          ),
                          child: Stack(
                            children: [
                              // Icon aligned to the left
                              Positioned(
                                left: 14.0,
                                top: 10,
                                child: Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              // Centered text
                              Center(
                                child: Text(
                                  'Sign in with Facebook',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AddHeight(0.01),
                      // For Google Sign In
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              // Icon aligned to the left
                              Positioned(
                                left: 14.0,
                                top: 10,
                                child: SizedBox(
                                  height: 36,
                                  width: 36,
                                  child: GloryAiAssetImage(
                                    imagePath: AppImages.googleIconGlory,
                                  ),
                                ),
                              ),
                              // Centered text
                              Center(
                                child: Text(
                                  'Sign in with Google',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: DesignConstants.kTextPurpleColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GloryAiAssetImage(imagePath: AppImages.cloudIcon),
                    ],
                  ),
                ),
                AddHeight(0.12),
              ],
            ),
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
              AppNavigation.navigateTo(AppRoutesNames.introEmbarkSacredScreen);
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
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
