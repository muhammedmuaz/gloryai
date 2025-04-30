import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    // Animation Timings
    final Duration initialDelay = 150.ms; // Base delay before animations start
    final Duration stagger = 100.ms; // Time between each staggered element
    final Duration shortFadeDuration = 400.ms;
    final Duration mediumFadeDuration = 500.ms;
    final Duration longFadeDuration = 600.ms;

    return Scaffold(
      body: Container(
        // Existing decoration
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DesignConstants.kBackgroundEndColor, // White
              DesignConstants.kBackgroundStartColor, // Light color
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: ScreenPadding(
            // Wrap the main Column content in a list for Animate().forEach
            // Or animate elements individually as below
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Bar ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications, color: DesignConstants.kAccentColor),
                    SizedBox(
                      height: height * 0.1,
                      child: GloryAiAssetImage(imagePath: AppImages.appLogoHomePage),
                    ),
                    Icon(Icons.face_6_outlined, color: DesignConstants.kAccentColor),
                  ],
                )
                    .animate(delay: initialDelay)
                    .fadeIn(duration: shortFadeDuration)
                    .slideY(begin: -0.2, duration: shortFadeDuration, curve: Curves.easeOut),

                AddHeight(0.015),

                // --- Greeting ---
                Text(
                  'Good morning, John,',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                )
                    .animate(delay: initialDelay + stagger) // Stagger 1
                    .fadeIn(duration: shortFadeDuration)
                    .slideX(begin: -0.15, duration: shortFadeDuration, curve: Curves.easeOut), // Slide in from left

                // --- Prompt ---
                Text(
                  'tell or ask your question to God:',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                )
                    .animate(delay: initialDelay + stagger * 2) // Stagger 2
                    .fadeIn(duration: shortFadeDuration)
                    .slideX(begin: -0.15, duration: shortFadeDuration, curve: Curves.easeOut), // Slide in from left

                AddHeight(0.015),

                // --- Input Card ---
                Card(
                  shadowColor: DesignConstants.kAccentColor.withOpacity(0.5),
                  margin: EdgeInsets.zero,
                  elevation: 5.0, // Increased elevation slightly
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    height: height * 0.15,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.mic, color: Color(0xff7fc4aa), size: 30) // Slightly larger mic
                            // Optional subtle pulse animation on the mic icon
                            .animate(delay: initialDelay + stagger * 3 + mediumFadeDuration) // Start after card fades in
                            .scaleXY(begin: 1.0, end: 1.1, duration: 1000.ms, curve: Curves.easeInOutSine)
                            .then(delay: 200.ms) // Pause
                            .scaleXY(begin: 1.1, end: 1.0, duration: 1000.ms, curve: Curves.easeInOutSine) // Scale back down
                            .callback(callback: (bool value) {  }), // Repeat the sequence
                      ],
                    ),
                  ),
                )
                    .animate(delay: initialDelay + stagger * 3) // Stagger 3
                    .fadeIn(duration: mediumFadeDuration)
                    .scaleXY(begin: 0.9, end: 1.0, duration: mediumFadeDuration, curve: Curves.easeOutBack), // Scale up with overshoot

                AddHeight(0.03),

                // --- Featured Verse ---
                Text(
                  '"For I know the plans I have for you," declares the Lord, "plans to prosper you and not to harm you, plans to give you hope and a future."',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: DesignConstants.kTextPurpleColor,
                        fontStyle: FontStyle.italic,
                        height: 1.4, // Improved line spacing
                      ),
                )
                    .animate(delay: initialDelay + stagger * 4) // Stagger 4
                    .fadeIn(duration: longFadeDuration, curve: Curves.easeIn)
                    .slideY(begin: 0.1, duration: mediumFadeDuration), // Slide up slightly

                AddHeight(0.02),

                // --- Verse Reference & Speaker ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Jeremiah 29:11',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                    ),
                    Icon(
                      Icons.volume_up_rounded,
                      color: DesignConstants.kAccentColor,
                      size: 28.0,
                    ),
                  ],
                )
                    .animate(delay: initialDelay + stagger * 5) // Stagger 5
                    .fadeIn(duration: shortFadeDuration)
                    .slideY(begin: 0.3, duration: shortFadeDuration, curve: Curves.easeOut), // Slide up more

                AddHeight(0.005),

                // --- Bottom Section (Animate as a group) ---
                Column(
                  children: [
                    Divider(thickness: 1, color: Colors.white.withOpacity(0.8)), // Slightly transparent divider
                    AddHeight(0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text(
                            'Receive insightful interpretations and meditations on Scripture to inspire your daily life',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: DesignConstants.kTextPurpleColor.withOpacity(0.9), // Slightly transparent text
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.notifications_none,
                              color: DesignConstants.kAccentColor,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AddHeight(0.005),
                    Divider(thickness: 1, color: DesignConstants.kAccentColor.withOpacity(0.8)), // Slightly transparent divider
                  ]
                )
                   .animate(delay: initialDelay + stagger * 6) // Stagger 6 (Last)
                   .fadeIn(duration: mediumFadeDuration)
                   .slideY(begin: 0.4, duration: mediumFadeDuration, curve: Curves.easeOut), // Slide up from bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}