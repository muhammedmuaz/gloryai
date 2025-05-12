import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/gloryai_storage.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add your initialization logic here

    Future.delayed(const Duration(seconds: 2), () async {
      await GloryAiStorage.initialize();
      String? token = await GloryAiStorage.getValue(
        DataConstants.storageUserId,
      );
      if (token != null && token.isNotEmpty) {
        AppNavigation.pushReplacementTo(AppRoutesNames.homeScreen2);
      } else {
        AppNavigation.pushReplacementTo(AppRoutesNames.introScreen);
      }
    });
  }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with subtle animation
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: width * 0.5,
                  child: GloryAiAssetImage(imagePath: AppImages.applogo),
                ),
              ),
              AddHeight(0.04),
              // Tagline with fade-in effect
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 1200),
                child: Text(
                  'Divine Wisdom, Daily',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
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
              ),
              AddHeight(0.1),
              // Loading indicator that matches your color scheme
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    DesignConstants.kShilo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
