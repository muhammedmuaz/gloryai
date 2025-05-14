import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/providers/auth_provider.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Get.put(AuthenticationProvider());
    Get.put(UserProvider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: DataConstants.kScreenHorizontalPadding,
        ),
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
              AddHeight(0.06),
              Text(
                '"Divine Wisdom, Daily"',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                  wordSpacing: -1.5,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.5,
                child: GloryAiAssetImage(imagePath: AppImages.introIcon),
              ),
              AddHeight(0.2),
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
              BottomSheetsAndDialogs.showLoadingDialog(context);
              Future.delayed(Duration(seconds: 2), () {
                isClickedInLogin = false;
                AppNavigation.goBack();
                AppNavigation.navigateTo(AppRoutesNames.introRatingScreen);
              });
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
                color: DesignConstants.kShilo,
                boxShadow: [
                  BoxShadow(
                    color: DesignConstants.kShilo.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    DesignConstants.kShilo,
                    DesignConstants.kShilo.withOpacity(0.9),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Proceed',
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
          AddHeight(0.01),
          GestureDetector(
            onTap: () {
              // BottomSheetsAndDialogs.showLoadingDialog(context);
              isClickedInLogin = true;
              AppNavigation.navigateTo(AppRoutesNames.introLoginScreen);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: DesignConstants.kTextPurpleColor.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      wordSpacing: -0.2,
                    ),
                  ),
                  TextSpan(
                    text: ' Log in',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: DesignConstants.kTextPurpleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      wordSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AddHeight(0.01),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
