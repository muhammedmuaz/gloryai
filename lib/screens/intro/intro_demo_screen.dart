import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroDemoScreen extends StatelessWidget {
  const IntroDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final logoDuration = 800.ms;
    final conversationDelay = logoDuration + 300.ms;
    final botMessageDuration = 600.ms;
    final userMessageDelay = conversationDelay + botMessageDuration;
    final userMessageDuration = 600.ms;

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
                  // Logo with enhanced animations
                  SizedBox(
                    width: width * 0.6,
                    child: GloryAiAssetImage(imagePath: AppImages.applogo),
                  ),

                  AddHeight(0.1),
                  // Bot message with typing indicator effect
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bot avatar with subtle pulse
                          GloryAiAssetImage(
                                imagePath: AppImages.appLogoWithOutLogoIcon,
                              )
                              .animate(delay: conversationDelay)
                              .scaleXY(
                                begin: 0.9,
                                end: 1,
                                duration: 300.ms,
                                curve: Curves.easeOutBack,
                              )
                              .then()
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .scaleXY(
                                begin: 1,
                                end: 1.03,
                                duration: 2000.ms,
                                curve: Curves.easeInOut,
                              ),

                          AddHeight(0.03),

                          // Message bubble with typing effect
                          Container(
                            constraints: BoxConstraints(maxWidth: width * 0.8),
                            child: Text(
                                  'That\'s a beautiful reflection.\nWhen we acknowledge that our\nstrength comes from Christ,\nit shifts our perspective from\nself-reliance to divine dependence.\nHow do you think this understanding\ncould change the way you approach\nchallenges in your daily life?',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: DesignConstants.kTextPurpleColor,
                                  ),
                                )
                                .animate(delay: conversationDelay + 200.ms)
                                .fadeIn(duration: botMessageDuration)
                                .slideX(
                                  begin: -20,
                                  end: 0,
                                  duration: botMessageDuration,
                                  curve: Curves.easeOutCubic,
                                )
                                .then()
                                .blur(
                                  begin: const Offset(0, 2),
                                  end: const Offset(0, 0),
                                  duration: 300.ms,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  AddHeight(0.05),

                  // User message with reaction animation
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Message card with pop-in effect
                          Card(
                                color: Colors.white,
                                shadowColor: DesignConstants.kTextLightColor,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Yeah, I\'ve been there!\nOnce I realized that I wasn\'t alone\nand that God was there\nto support me, I felt a huge weight\nlifted off my shoulders.\nIt\'s amazing how much difference\nit can make.',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                ),
                              )
                              .animate(delay: userMessageDelay)
                              .scaleXY(
                                begin: 0.5,
                                end: 1,
                                duration: userMessageDuration,
                                curve: Curves.elasticOut,
                              )
                              .fadeIn(duration: userMessageDuration)
                              .slideX(
                                begin: 20,
                                end: 0,
                                duration: userMessageDuration,
                                curve: Curves.easeOutCubic,
                              ),
                        ],
                      ),
                    ],
                  ),

                  AddHeight(0.1),
                ],
              ),
            ),
          ),
        ),
      ),

      // Next button with enhanced animations
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(AppRoutesNames.introDevotionalScreen);
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
