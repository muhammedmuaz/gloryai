import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/page%20animations/page_animations.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/intro/intro_quote_2_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroScriptureScreen extends StatelessWidget {
  const IntroScriptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final logoDuration = 800.ms;
    final taglineDelay = logoDuration * 0.5;
    final taglineDuration = 600.ms;
    final bottomElementsDelay = taglineDelay + taglineDuration * 0.5;
    final bottomElementsDuration = 700.ms;

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
                      )
                      .animate()
                      .fadeIn(duration: logoDuration, curve: Curves.easeOut)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                        duration: logoDuration,
                        curve: Curves.easeOut,
                      )
                      .then(delay: 300.ms)
                      .animate(
                        onPlay: (controller) => controller.repeat(reverse: true),
                      )
                      .moveY(
                        begin: -4,
                        end: 4,
                        duration: 2500.ms,
                        curve: Curves.easeInOutSine,
                      ), // Gentle float
              
                  AddHeight(0.05),
                  // --- Animated Tagline ---
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Daily Scripture\nto Light Your Path',
                      textAlign:
                          TextAlign.center,
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
                      'Every morning, we\'ll share a verse chosen\nfor your faith journey-building\na foundation for your daily walk with God.',
                      textAlign:
                          TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    ),
                  ),
                  AddHeight(0.05),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: DesignConstants.kBlossom,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text('1.', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),),
                  ),
                  AddHeight(0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Deep Understanding',
                      textAlign:
                          TextAlign.center,
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
                      'Explore scripture\'s meaning with faith-centered insights whenever you need.',
                      textAlign:
                          TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    ),
                  ),
                  AddHeight(0.05),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: DesignConstants.kBlossom,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text('2.', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),),
                  ),
                  AddHeight(0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Personalized',
                      textAlign:
                          TextAlign.center,
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
                      'Scripture chosen uniquely for your faith tradition and journey.',
                      textAlign:
                          TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    ),
                  ),
                  AddHeight(0.05),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: DesignConstants.kBlossom,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text('3.', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),),
                  ),
                  AddHeight(0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding,
                    ),
                    child: Text(
                      'Daily Guidance',
                      textAlign:
                          TextAlign.center,
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
                      'Start each morning with God\'s Word to illuminate your path.',
                      textAlign:
                          TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: DesignConstants.kTextPurpleColor,
                      ),
                    ),
                  ),
                  // CircularFindContainer(onTap: () {}, title: 'Orthodox'),
                  // AddHeight(0.01),
                  // CircularFindContainer(onTap: () {}, title: 'Anglican'),
                  // AddHeight(0.01),
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
                  final RenderBox button =
                      context.findRenderObject() as RenderBox;
                  final buttonPosition = button.localToGlobal(Offset.zero);
                  final buttonSize = button.size;
                  final buttonCenter = Offset(
                    buttonPosition.dx + buttonSize.width / 2,
                    buttonPosition.dy + buttonSize.height / 2,
                  );

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              const IntroQuote2Screen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return ClipPath(
                          clipper: CircleRevealClipper(
                            fraction: animation.value,
                            center: buttonCenter,
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: width * 0.85,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: DesignConstants.kTextGreenColor,
                  ),
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AddHeight(0.015),
              AddHeight(0.015),
            ],
          )
          .animate(
            delay: bottomElementsDelay,
          )
          .fadeIn(duration: bottomElementsDuration, curve: Curves.easeOut)
          .slideY(
            begin: 0.4,
            end: 0,
            duration: bottomElementsDuration,
            curve: Curves.easeOut,
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
