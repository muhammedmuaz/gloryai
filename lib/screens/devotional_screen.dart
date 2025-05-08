import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

class DevotionalScreen extends StatelessWidget {
  const DevotionalScreen({super.key});

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
              child: Column(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Devotionals',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      ),
                      AddHeight(0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.only(
                                top: 2.5,
                                left: 2.5,
                                right: 2.5,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'COMPLETE',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: DesignConstants.kTextLightColor,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '5',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                DesignConstants
                                                    .kTextPurpleColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.only(
                                top: 2.5,
                                left: 2.5,
                                right: 2.5,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kBackgroundStartColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'MILESTONE',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: DesignConstants.kTextLightColor,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  DesignConstants
                                                      .kTextGreenColor,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  DesignConstants
                                                      .kTextLightColor,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  DesignConstants
                                                      .kTextLightColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.only(
                                top: 2.5,
                                left: 2.5,
                                right: 2.5,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                padding: EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'WEEKLY GOAL',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: DesignConstants.kTextLightColor,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '7/7',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  DesignConstants
                                                      .kTextPurpleColor,
                                            ),
                                          ),
                                          //  SizedBox(height: 5,),
                                          Text(
                                            'DAYS',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  DesignConstants
                                                      .kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 130,
                              padding: EdgeInsets.only(
                                top: 2.5,
                                left: 2.5,
                                right: 2.5,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: DesignConstants.kTextLightColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'STREAK',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: DesignConstants.kTextLightColor,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '2',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  DesignConstants
                                                      .kTextPurpleColor,
                                            ),
                                          ),
                                          //  SizedBox(height: 5,),
                                          Text(
                                            'WEEKS',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  DesignConstants
                                                      .kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 145,
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                          top: 2.5,
                          left: 2.5,
                          right: 2.5,
                          bottom: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: DesignConstants.kTextLightColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            vertical: 
                            12.0, 
                            horizontal: 18.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'APRIL',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: DesignConstants.kTextLightColor,
                                      // letterSpacing: -0.2,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: DesignConstants.kTextLightColor,
                                    size: 21,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'SUN',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '13',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'MON',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '14',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'TUE',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '15',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'WED',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '16',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'THU',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '17',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'FRI',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '18',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: DesignConstants.kTextGreenColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                     Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'SAT',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextLightColor,
                                              letterSpacing: -0.2,
                                            ),
                                          ),
                                          Text(
                                            '19',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w400,
                                              color: DesignConstants.kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
              // AppNavigation.navigateTo(
              //   AppRoutesNames.homeScreen2,
              // );
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
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

























//  Stack(
//         children: [
//           Positioned(
//             bottom: height * 0.06,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               width: double.maxFinite,
//               height: height * 0.35,
//               child: GloryAiAssetImage(
//                 imagePath: AppImages.homeTIconGlory,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),

//           ScreenPadding(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: width * 0.35,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               height: 45,
//                               width: 45,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 color: DesignConstants.kHomeBoxColor2,
//                               ),
//                               child: Icon(
//                                 Icons.menu,
//                                 color: Colors.white,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10.0),

//                           GestureDetector(
//                             onTap: (){
//                               AppNavigation.navigateTo(
//                                 AppRoutesNames.notificationListScreen,
//                               );
//                             },
//                             child: Container(
//                               height: 45,
//                               width: 45,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 color: DesignConstants.kHomeBoxColor2,
//                               ),
//                               child: Icon(
//                                 Icons.notifications,
//                                 color: DesignConstants.kTextLightColor,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * 0.1,
//                       child: GloryAiAssetImage(
//                         imagePath: AppImages.appLogoHomePage,
//                       ),
//                     ),
//                     Expanded(child: SizedBox()),
//                     Container(
//                       height: 55,
//                       width: 55,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.0),
//                         color: DesignConstants.kTextLightColor,
//                       ),
//                       child: Icon(
//                         Icons.tag_faces_outlined,
//                         color: Colors.white,
//                         size: 32,
//                       ),
//                     ),
//                   ],
//                 ),
//                 AddHeight(0.02),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Devotionals',
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w400,
//                         color: DesignConstants.kTextPurpleColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 AddHeight(0.02),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         padding: EdgeInsets.only(
//                           top: 2.5,
//                           left: 2.5,
//                           right: 2.5,
//                           bottom: 10.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: DesignConstants.kTextLightColor,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Container(
//                           height: double.maxFinite,
//                           width: double.maxFinite,
//                           padding: EdgeInsets.all(12.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'COMPLETE',
//                                 style: Theme.of(
//                                   context,
//                                 ).textTheme.bodyMedium!.copyWith(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: DesignConstants.kTextLightColor,
//                                   letterSpacing: -0.2,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     '5',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         padding: EdgeInsets.only(
//                           top: 2.5,
//                           left: 2.5,
//                           right: 2.5,
//                           bottom: 10.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: DesignConstants.kTextLightColor,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Container(
//                           height: double.maxFinite,
//                           width: double.maxFinite,
//                           padding: EdgeInsets.all(12.0),
//                           decoration: BoxDecoration(
//                             color: DesignConstants.kBackgroundStartColor,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'MILESTONE',
//                                 style: Theme.of(
//                                   context,
//                                 ).textTheme.bodyMedium!.copyWith(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: DesignConstants.kTextLightColor,
//                                   letterSpacing: -0.2,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: DesignConstants.kTextGreenColor,
//                                       ),
//                                     ),
//                                     SizedBox(width: 6),
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: DesignConstants.kTextLightColor,
//                                       ),
//                                     ),
//                                     SizedBox(width: 6),
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: DesignConstants.kTextLightColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12.0),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         padding: EdgeInsets.only(
//                           top: 2.5,
//                           left: 2.5,
//                           right: 2.5,
//                           bottom: 10.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: DesignConstants.kTextLightColor,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Container(
//                           height: double.maxFinite,
//                           width: double.maxFinite,
//                           padding: EdgeInsets.only(
//                             left: 12,
//                             right: 12,
//                             top: 12,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'WEEKLY GOAL',
//                                 style: Theme.of(
//                                   context,
//                                 ).textTheme.bodyMedium!.copyWith(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: DesignConstants.kTextLightColor,
//                                   letterSpacing: -0.2,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       '7/7',
//                                       style: Theme.of(
//                                         context,
//                                       ).textTheme.bodyMedium!.copyWith(
//                                         fontSize: 32,
//                                         fontWeight: FontWeight.bold,
//                                         color: DesignConstants.kTextPurpleColor,
//                                       ),
//                                     ),
//                                     //  SizedBox(height: 5,),
//                                     Text(
//                                       'DAYS',
//                                       style: Theme.of(
//                                         context,
//                                       ).textTheme.bodyMedium!.copyWith(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         color: DesignConstants.kTextLightColor,
//                                         letterSpacing: -0.2,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         padding: EdgeInsets.only(
//                           top: 2.5,
//                           left: 2.5,
//                           right: 2.5,
//                           bottom: 10.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: DesignConstants.kTextLightColor,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Container(
//                           height: double.maxFinite,
//                           width: double.maxFinite,
//                           padding: EdgeInsets.all(12.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'STREAK',
//                                 style: Theme.of(
//                                   context,
//                                 ).textTheme.bodyMedium!.copyWith(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: DesignConstants.kTextLightColor,
//                                   letterSpacing: -0.2,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       '2',
//                                       style: Theme.of(
//                                         context,
//                                       ).textTheme.bodyMedium!.copyWith(
//                                         fontSize: 32,
//                                         fontWeight: FontWeight.bold,
//                                         color: DesignConstants.kTextPurpleColor,
//                                       ),
//                                     ),
//                                     //  SizedBox(height: 5,),
//                                     Text(
//                                       'WEEKS',
//                                       style: Theme.of(
//                                         context,
//                                       ).textTheme.bodyMedium!.copyWith(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         color: DesignConstants.kTextLightColor,
//                                         letterSpacing: -0.2,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12.0),
//                 Container(
//                   height: 130,
//                   width: double.maxFinite,
//                   padding: EdgeInsets.only(
//                     top: 2.5,
//                     left: 2.5,
//                     right: 2.5,
//                     bottom: 10.0,
//                   ),
//                   decoration: BoxDecoration(
//                     color: DesignConstants.kTextLightColor,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Container(
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     padding: EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 18.0,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'APRIL',
//                               style: Theme.of(
//                                 context,
//                               ).textTheme.bodyMedium!.copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: DesignConstants.kTextLightColor,
//                                 // letterSpacing: -0.2,
//                               ),
//                             ),
//                             SizedBox(width: 7),
//                             Icon(
//                               Icons.keyboard_arrow_down_outlined,
//                               color: DesignConstants.kTextLightColor,
//                               size: 21,
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'SUN',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '13',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'MON',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '14',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'TUE',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '15',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'WED',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '16',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'THU',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '17',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'FRI',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '18',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.bold,
//                                       color: DesignConstants.kTextGreenColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'SAT',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextLightColor,
//                                       letterSpacing: -0.2,
//                                     ),
//                                   ),
//                                   Text(
//                                     '19',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodyMedium!.copyWith(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400,
//                                       color: DesignConstants.kTextPurpleColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
