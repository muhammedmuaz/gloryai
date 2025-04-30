import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/screens/widgets/settings_tile.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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

                  // AddHeight(0.01),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: DesignConstants.kTextPurpleColor,
                    ),
                  ),
                  AddHeight(0.015),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SettingsTile(
                        title: 'Rate Us',
                        iconPath: AppImages.starIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Lock Screen',
                        iconPath: AppImages.phoneIconSettingPageGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Branch',
                        iconPath: AppImages.branchIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Gender',
                        iconPath: AppImages.genderIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Notifications',
                        iconPath: AppImages.notificationIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Contact Support',
                        iconPath: AppImages.contactSupportIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(
                        title: 'Log Out',
                        iconPath: AppImages.logOutIconGlory,
                      ),
                      AddHeight(0.008),
                      SettingsTile(title: 'Terms & Conditions', iconPath: null),
                      AddHeight(0.008),
                      SettingsTile(title: 'Privacy Policy', iconPath: null),
                      AddHeight(0.008),
                      SettingsTile(title: 'Delete Account', iconPath: null),
                      AddHeight(0.12),
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
     
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
