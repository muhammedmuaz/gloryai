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

class IntroEmbarkSacredScreen extends StatefulWidget {
  const IntroEmbarkSacredScreen({super.key});

  @override
  State<IntroEmbarkSacredScreen> createState() =>
      _IntroEmbarkSacredScreenState();
}

class _IntroEmbarkSacredScreenState extends State<IntroEmbarkSacredScreen> {
  int initialDelay = 300;
  int itemDelay = 200; // Delay between each item animation

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    // Helper function to build animated list items
    Widget _buildAnimatedItem({
      required int index,
      required String title,
      required String description,
    }) {
      final delay = (initialDelay + (itemDelay * index)).ms;

      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Number badge with pop-in effect
              Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: DesignConstants.kShilo,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: DesignConstants.kShilo.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      '$index.',
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

              SizedBox(width: width * 0.04),

              // Content with slide-in animation
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                          title,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        )
                        .animate(delay: delay + 100.ms)
                        .fadeIn()
                        .slideX(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

                    Text(
                          description,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        )
                        .animate(delay: delay + 200.ms)
                        .fadeIn()
                        .slideX(begin: 0.1, end: 0, curve: Curves.easeOutCubic),
                  ],
                ),
              ),
            ],
          ),
          AddHeight(0.02),
        ],
      );
    }

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddHeight(0.05),
                  SizedBox(
                    width: width * 0.6,
                    child: GloryAiAssetImage(imagePath: AppImages.applogo),
                  ),
                  AddHeight(0.03),
                  // Tagline with attention-grabbing animation
                  Text(
                    'Embark on Your Sacred Journey Here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.1, end: 0),
                  AddHeight(0.005),
                  Text(
                    'By making this commitment,\nyou are choosing to:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ).animate(delay: 300.ms).fadeIn().slideY(begin: 0.1, end: 0),
                  AddHeight(0.02),

                  // Animated list items
                  _buildAnimatedItem(
                    index: 1,
                    title: 'Set aside time each day for God\'s Word',
                    description: 'Allow scripture to direct your daily path.',
                  ),

                  _buildAnimatedItem(
                    index: 2,
                    title: 'Enhance your prayer life',
                    description:
                        'Deepen your connection through daily prayers.',
                  ),

                  _buildAnimatedItem(
                    index: 3,
                    title: 'Advance in your faith journey',
                    description: 'Move closer to God each day.',
                  ),

                  _buildAnimatedItem(
                    index: 4,
                    title: 'Give and receive support',
                    description: 'Join a community of devoted believers.',
                  ),

                  AddHeight(0.02),
                  Text(
                        'This commitment is made between you and God. We are here to support your journey Commit to Your Journey.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                        ),
                      )
                      .animate(delay: (initialDelay + (itemDelay * 4)).ms)
                      .fadeIn()
                      .slideY(begin: 0.1, end: 0),
                  AddHeight(0.12),
                ],
              ),
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
              AppNavigation.navigateTo(AppRoutesNames.introDailySacredScreen);
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
                        'Commit to Your Journey',
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

          AddHeight(0.01),
          Text(
            'Begin your path to deeper faith now',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: DesignConstants.kTextPurpleColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
