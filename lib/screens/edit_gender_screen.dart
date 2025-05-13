import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class EditGenderSelectScreen extends StatefulWidget {
  const EditGenderSelectScreen({super.key});

  @override
  State<EditGenderSelectScreen> createState() => _EditGenderSelectScreenState();
}

class _EditGenderSelectScreenState extends State<EditGenderSelectScreen> {
  String? _selectedOption;
  final List<String> _options = ['Male', 'Female'];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final UserProvider userProvider = Get.find();

      if (userProvider.userProfile != null) {
        for (var i = 0; i < _options.length; i++) {
          if (_options[i].toLowerCase() ==
              userProvider.userProfile!.gender!.toLowerCase()) {
            print("Matched");
            _selectedOption = _options[i];
            setState(() {});
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            AppNavigation.goBack();
          },
          child: Hero(
            tag: 'heading',
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: DesignConstants.kTextPurpleColor,
            ),
          ),
        ),
        title: Text(
          "Gender Screen",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: DesignConstants.kTextPurpleColor,
          ),
        ),
      ),
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      child: Text(
                        'Where should Glory address you?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                          height: 1.3,
                        ),
                      ),
                    ),
                    AddHeight(0.03),
                    Column(
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

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DataConstants.kScreenHorizontalPadding,
                      ),
                      child: GloryAiAssetImage(imagePath: AppImages.cloudIcon),
                    ),
                  ],
                ),
              ),

              AddHeight(0.15),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
           GetBuilder<UserProvider>(
            builder: (value) {
               if (value.isUpdateingGender) {
                return Center(child: CupertinoActivityIndicator());
              }
              return GestureDetector(
                onTap:
                    _selectedOption != null
                        ? () {
                          final UserProvider userProvider = Get.find();
                          userProvider.updateGender(_selectedOption!);
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
                            'Update',
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
              );
            }
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
        padding: const EdgeInsets.symmetric(vertical: 8),
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
                  fontSize: 21,
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
