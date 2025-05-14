import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/providers/auth_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroAgeGroupScreen extends StatefulWidget {
  const IntroAgeGroupScreen({super.key});

  @override
  State<IntroAgeGroupScreen> createState() => _IntroAgeGroupScreenState();
}

class _IntroAgeGroupScreenState extends State<IntroAgeGroupScreen> {
  String? _selectedOption;
  final List<String> _options = [
    '10-17',
    '18-25',
    '26-35',
    '36-45',
    '46-55',
    '56 and above',
  ];
  final AuthenticationProvider authProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen =
        screenWidth < 600; // Example breakpoint for small screens
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
              AddHeight(0.05),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                child: Text(
                  'Which age category do you belong to?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
              ),
              AddHeight(0.015),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DataConstants.kScreenHorizontalPadding,
                ),
                child: Text(
                  'Faith journeys evolve based on life experiences. This allows us to offer scripture and guidance that aligns with your life stage.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.03),
                    child: Column(
                      children:
                          _options.map((option) {
                            return Column(
                              children: [
                                _buildCircularOption(context, option),
                                AddHeight(0.01),
                              ],
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),

              AddHeight(0.13),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DataConstants.kScreenHorizontalPadding,
            ),
            child: Text(
              'Your answers will remain private and secure.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: DesignConstants.kTextPurpleColor,
              ),
            ),
          ),
          AddHeight(0.02),
          GestureDetector(
            onTap:
                _selectedOption != null
                    ? () {
                      authProvider.saveFormAnswer(
                        'ageCategory',
                        _selectedOption,
                      );
                      AppNavigation.navigateTo(
                        AppRoutesNames.introGenderSelectScreen,
                      );
                    }
                    : null,
            child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color:
                        _selectedOption != null
                            ? DesignConstants.kTextGreenColor
                            : Colors.grey.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: (_selectedOption != null
                                ? DesignConstants.kTextGreenColor
                                // ignore: deprecated_member_use
                                : Colors.grey.withOpacity(0.3))
                            .withOpacity(0.4),
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
                .animate(
                  onPlay:
                      (controller) =>
                          _selectedOption != null ? controller.repeat() : null,
                )
                .shimmer(
                  delay: 1000.ms,
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.3),
                )
                .animate(
                  onPlay:
                      (controller) =>
                          _selectedOption != null ? controller.repeat() : null,
                )
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

  Widget _buildCircularOption(BuildContext context, String title) {
    final isSelected = _selectedOption == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = isSelected ? null : title;
        });
      },
      child: AnimatedContainer(
        duration: 300.ms,
        curve: Curves.easeOutQuad,
        margin: EdgeInsets.symmetric(
          horizontal: DataConstants.kScreenHorizontalPadding,
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? DesignConstants.kTextLightColor.withOpacity(0.5)
                  : DesignConstants.kTextLightColor,
          borderRadius: BorderRadius.circular(100),
          border:
              isSelected
                  ? Border.all(
                    width: 1.5,
                    color: DesignConstants.kTextLightColor,
                  )
                  : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: 200.ms,
              scale: isSelected ? 1.05 : 1.0,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ],
        ),
      ).animate(
        onComplete: (controller) {
          if (isSelected) {
            controller.repeat();
          }
        },
      ),
    );
  }
}
