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
class IntroDailySacredScreen extends StatelessWidget {
  const IntroDailySacredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    const initialDelay = 300;
    const itemDelay = 200; // Delay between each item animation

    // Helper function to build animated feature rows
    Widget _buildAnimatedFeatureRow({
      required int index,
      required IconData icon,
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
              // Icon card with pop-in effect
              SizedBox(
                height: 55,
                width: 55,
                child: Card(
                  elevation: 5,
                  color: DesignConstants.kBackgroundStartColor,
                  shadowColor: DesignConstants.kShilo,
                  child: Icon(
                    icon,
                    color: DesignConstants.kShilo,
                    size: 30,
                  ),
                )
                .animate(delay: delay)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  curve: Curves.elasticOut,
                )
                .fadeIn(),
              ),
              
              SizedBox(width: width * 0.04),
              
              // Content with slide-in animation
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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

    // Special case for the prayer icon (custom image)
    Widget _buildPrayerFeatureRow() {
      final delay = (initialDelay + (itemDelay * 2)).ms;
      
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: Card(
                  elevation: 5,
                  color: DesignConstants.kBackgroundStartColor,
                  shadowColor: DesignConstants.kShilo,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GloryAiAssetImage(
                      imagePath: AppImages.prayIconGlory,
                    ),
                  ),
                )
                .animate(delay: delay)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  curve: Curves.elasticOut,
                )
                .fadeIn(),
              ),
              
              SizedBox(width: width * 0.04),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prayer Assistance',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    )
                    .animate(delay: delay + 100.ms)
                    .fadeIn()
                    .slideX(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
                    
                    Text(
                      'Discover the appropriate words for any moment in your spiritual journey',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  )
                  ,
                  
                  AddHeight(0.05),
                  
                  Text(
                    'Your Daily Journey with God',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ),
                  
                  AddHeight(0.01),
                  
                  Text(
                    'Discover what lies ahead\non your path:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ),
                  
                  AddHeight(0.02),
                  
                  // Animated feature rows
                  _buildAnimatedFeatureRow(
                    index: 0,
                    icon: Icons.book,
                    title: 'Daily AI-Enhanced Devotionals',
                    description: 'Begin each day with personalized insights and reflections from scripture.',
                  ),
                  
                  _buildAnimatedFeatureRow(
                    index: 1,
                    icon: Icons.calendar_month,
                    title: 'Spiritual Guidance Tailored to You',
                    description: 'Receive faith-based advice for life\'s questions and challenges.',
                  ),
                  
                  _buildPrayerFeatureRow(),
                  
                  _buildAnimatedFeatureRow(
                    index: 3,
                    icon: Icons.share,
                    title: 'Faith Community Wall',
                    description: 'Connect with thousands sharing their faith together',
                  ),
                  
                  AddHeight(0.2),
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
              AppNavigation.navigateTo(AppRoutesNames.introDailyGuidedScreen);
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
                        'Complete Setup',
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