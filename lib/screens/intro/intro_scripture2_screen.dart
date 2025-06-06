
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

class IntroScripture2Screen extends StatelessWidget {
  const IntroScripture2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    const initialDelay = 300;
    const sectionDelay = 300;
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
            child: Stack(
              children: [
               Positioned(
                      bottom: height*0.15,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: DataConstants.kScreenHorizontalPadding),
                        child: GloryAiAssetImage(imagePath: AppImages.cloudIcon))),
                SizedBox(
                  height: height,
                  width: width,
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: DataConstants.kScreenHorizontalPadding,
                            ),
                            child: Text(
                              'Transform Scripture into Conversation',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextPurpleColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: DataConstants.kScreenHorizontalPadding,
                            ),
                            child: Text(
                              'Your daily time with God through meaningful conversation',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextPurpleColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                  
                      AddHeight(0.03),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Section 1 with coordinated animations
                              _buildSection(
                                context,
                                number: '1',
                                title: 'Lasting Impact',
                                description:
                                    'Take away insights, reflections, and action steps.',
                                delay: (initialDelay + sectionDelay).ms,
                              ),
                  
                              AddHeight(0.025),
                  
                              // Section 2 with coordinated animations
                              _buildSection(
                                context,
                                number: '2',
                                title: 'Personal Journey',
                                description:
                                    'Conversations that grow with your faith walk.',
                                delay: (initialDelay + sectionDelay * 2).ms,
                              ),
                  
                              AddHeight(0.025),
                  
                              // Section 3 with coordinated animations
                              _buildSection(
                                context,
                                number: '3',
                                title: 'Daily Dedication',
                                description:
                                    'Build lasting habits with 5-10 minutes of reflection.',
                                delay: (initialDelay + sectionDelay * 3).ms,
                              ),
                            ],
                          ),
                        ),
                      ),
                  
                      AddHeight(0.12),
                    ],
                  ),
                ),
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
              AppNavigation.navigateTo(AppRoutesNames.introDemoScreen);
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

  Widget _buildSection(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
    Duration delay = Duration.zero,
  }) {
    return Column(
      children: [
        // Number badge with pop-in effect
        Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: DesignConstants.kBlossom,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: DesignConstants.kBlossom.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                '$number.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            )
            .animate(delay: delay)
            .scale(
              begin: const Offset(0.5, 0.5),
              end: const Offset(1, 1),
              curve: Curves.elasticOut,
            )
            .fadeIn(),

        AddHeight(0.015),

        // Title with slide-up animation
        Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DataConstants.kScreenHorizontalPadding,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
            )
            .animate(delay: (delay + 100.ms))
            .fadeIn()
            .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
        Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DataConstants.kScreenHorizontalPadding,
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
            )
            .animate(delay: (delay + 200.ms))
            .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
            .slideY(begin: 0.1, end: 0),
      ],
    );
  }
}
