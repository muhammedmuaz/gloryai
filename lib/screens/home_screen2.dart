import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        // Existing decoration
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: Container(
              height: height,
              width: width,
              child: Stack(
                children: [
                  // SizedBox(
                  //   height: height,
                  //   width: width,
                     Positioned(
                      bottom: height*0.2,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: DataConstants.kScreenHorizontalPadding),
                        child: GloryAiAssetImage(imagePath: AppImages.cloudIcon))),
                  
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: DesignConstants.kHomeBoxColor2,
                                    ),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                    
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: DesignConstants.kHomeBoxColor2,
                                    ),
                                    child: Icon(
                                      Icons.notifications,
                                      color: DesignConstants.kTextLightColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                              child: GloryAiAssetImage(
                                imagePath: AppImages.appLogoHomePage,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: DesignConstants.kTextLightColor,
                              ),
                              child: Icon(
                                Icons.tag_faces_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.02),
                        Container(
                          height: 90,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: DesignConstants.kHomeBoxColor2,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Good morning, John,',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: DesignConstants.kTextPurpleColor,
                                ),
                              ),
                              Text(
                                'Walking in his truth',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: DesignConstants.kTextPurpleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AddHeight(0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Today\'s Scripture',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: DesignConstants.kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.025),
                        Text(
                          'and the messenger of the Lord appeared to him and said: The Lord is with you, you mighty warrior',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                        AddHeight(0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Judge 6:12',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: DesignConstants.kTextGreenColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.01),
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: DataConstants.kScreenHorizontalPadding,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: DesignConstants.kCaribbeanGreen,
                            ),
                          ),
                          child: Text(
                            'Help me understand',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextGreenColor,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  
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
              AppNavigation.navigateTo(
                AppRoutesNames.devotionalScreen
              );
            },
            child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: DesignConstants.kTextGreenColor,
                    boxShadow: [
                      BoxShadow(
                        color: DesignConstants.kTextGreenColor.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        DesignConstants.kTextGreenColor.withOpacity(0.9),
                        DesignConstants.kTextGreenColor,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Devotional',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                )
          ),
          AddHeight(0.015),
          AddHeight(0.015),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
