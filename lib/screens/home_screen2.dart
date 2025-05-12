import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/models/bible_books_model.dart';
import 'package:gloryai/providers/auth_provider.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/calendar_screen.dart';
import 'package:gloryai/screens/select_bible_version.dart';
import 'package:gloryai/screens/widgets/settings_tile.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:gloryai/utils/screen_helper.dart';
import 'package:shimmer/shimmer.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';

int? _selectedIndex;

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  
  final Duration _animationDuration = 300.ms;
  int activeWidget = 0;

  @override
  void initState() {
    if (!Get.isRegistered<AuthenticationProvider>()) {
      Get.put(AuthenticationProvider());
    }
    if (!Get.isRegistered<UserProvider>()) {
      Get.put(UserProvider());
      final UserProvider userProvider = Get.find();
      Future.delayed(Duration(seconds: 2), () async {
        await userProvider.fetchUserProfile().then((e){
          SchedulerBinding.instance.addPostFrameCallback((_) {
      final UserProvider userProvider = Get.find();
      if (userProvider.userProfile != null) {
        for (var i = 0; i < bibleBooks.length; i++) {
          // print(bibleBooks[i].name);
          print(userProvider.userProfile!.bibleVersion! == bibleBooks[i].name);
          if (bibleBooks[i].name.toLowerCase() ==
              userProvider.userProfile!.bibleVersion!.toLowerCase()) {
                print("mattttccchhhhrrrdddd");
            _selectedIndex = i;
            setState(() {});
          }
        }
      }
    });
        });
      });
    }
    else {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final UserProvider userProvider = Get.find();
      if (userProvider.userProfile != null) {
        for (var i = 0; i < bibleBooks.length; i++) {
          if (bibleBooks[i].name ==
              userProvider.userProfile!.bibleVersion!.toLowerCase()) {
                print("mattttccchhhhrrrdddd");
            _selectedIndex = i;
            setState(() {});
          }
        }
      }
    });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);

    List<Widget> homeScreens = [
      Stack(
        children: [
          Positioned(
            bottom: height * 0.06,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,

                  child: GloryAiAssetImage(imagePath: AppImages.cloudIcon),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: height * 0.35,
                  child: GloryAiAssetImage(
                    imagePath: AppImages.homeTIconGlory,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          ScreenPadding(
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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                          ),
                          SizedBox(width: 10.0),

                          GestureDetector(
                            onTap: () {
                              AppNavigation.navigateTo(
                                AppRoutesNames.notificationListScreen,
                              );
                            },
                            child: Container(
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
                  child: GetBuilder<UserProvider>(
                    builder: (value) {
                      if (value.isProfileFetching) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: DesignConstants.kAmethystSmoke
                                  .withOpacity(0.5),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 200,
                                height: 24,
                                margin: EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextPurpleColor
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: DesignConstants.kAmethystSmoke
                                  .withOpacity(0.5),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 150,
                                height: 20,
                                margin: EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextPurpleColor
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Good morning, ${value.userProfile != null ? value.userProfile!.name : ''},',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                          Text(
                            'Walking in his truth',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: DesignConstants.kTextPurpleColor,
                            ),
                          ),
                        ],
                      );
                    },
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
                        fontSize: 21,
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
                    fontSize: 18,
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
                GestureDetector(
                  onTap: () {
                    AppNavigation.navigateTo(
                      AppRoutesNames.gloryBibleLinesScreen,
                    );
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Positioned(
            bottom: height * 0.06,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: height * 0.35,
                  child: GloryAiAssetImage(
                    imagePath: AppImages.homeTIconGlory,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          CalendarPage(),
        ],
      ),
      SafeArea(
        child: ScreenPadding(
          child: Column(
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
                        GestureDetector(
                          onTap: () {
                            AppNavigation.navigateTo(
                              AppRoutesNames.notificationListScreen,
                            );
                          },
                          child: Container(
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
              Text(
                'Biblical Gospels and versions',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'The New Testament contains four canonical gospels that narrate the life and teachings of Jesus Christ:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
              AddHeight(0.01),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.65,
                            ),
                        itemCount: bibleBooks.length,
                        itemBuilder: (context, index) {
                          final isSelected = _selectedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                // Animated Bible Cover
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            bibleBooks[index].imgUrl,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    if (isSelected)
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            )
                                            .animate()
                                            .fadeIn(
                                              duration: _animationDuration,
                                            )
                                            .scale(begin: Offset(0, 0.5)),
                                      ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Text(
                                    bibleBooks[index].name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.bold
                                              : FontWeight.w500,
                                      color:
                                          isSelected
                                              ? DesignConstants.kTextPurpleColor
                                              : DesignConstants.kTextPurpleColor
                                                  .withOpacity(0.7),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      AddHeight(0.2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ScreenPadding(
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
                      GestureDetector(
                        onTap: () {},
                        child: Container(
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
                      ),
                      SizedBox(width: 10.0),

                      GestureDetector(
                        onTap: () {
                          AppNavigation.navigateTo(
                            AppRoutesNames.notificationListScreen,
                          );
                        },
                        child: Container(
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
            Hero(
              tag: 'heading',
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextPurpleColor,
                ),
              ),
            ),
            AddHeight(0.015),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SettingsTile(
                      title: 'Rate Us',
                      iconPath: AppImages.starIconGlory,
                      onTap: () {
                        HelperFunctions.launchLink(
                          context,
                          url: "https://play.google.com/",
                        );
                      },
                    ),
                    // AddHeight(0.008),
                    // SettingsTile(
                    //   title: 'Lock Screen',
                    //   iconPath: AppImages.phoneIconSettingPageGlory,
                    // ),
                    AddHeight(0.008),
                    SettingsTile(
                      title: 'Branch',
                      iconPath: AppImages.branchIconGlory,
                      onTap: () {
                        AppNavigation.navigateTo(
                          AppRoutesNames.editTraditionSelectScreen,
                        );
                      },
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      title: 'Gender',
                      iconPath: AppImages.genderIconGlory,
                      onTap: () {
                        AppNavigation.navigateTo(
                          AppRoutesNames.editGenderSelectScreen,
                        );
                      },
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: () {
                        AppNavigation.navigateTo(
                          AppRoutesNames.notificationListScreen,
                        );
                      },
                      title: 'Notifications',
                      iconPath: AppImages.notificationIconGlory,
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: () {
                        HelperFunctions.launchEmail(context);
                      },
                      title: 'Contact Support',
                      iconPath: AppImages.contactSupportIconGlory,
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: (){
                        // signOut()
                        BottomSheetsAndDialogs.showLogoutDialog(context, onConfirm: ()async {
                          final AuthenticationProvider authenticationProvider = Get.find();
                           AppNavigation.goBack();
        BottomSheetsAndDialogs.showLoadingDialogTitle(
            AppNavigation.navigatorKey.currentContext!,
            title: 'Logging out...');
        
                          await authenticationProvider.signOut();
                        });
                      },
                      title: 'Log Out',
                      iconPath: AppImages.logOutIconGlory,
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: () {
                        HelperFunctions.launchLink(
                          context,
                          url: "https://gloryai.com",
                        );
                      },
                      title: 'Terms & Conditions',
                      iconPath: null,
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: () {
                        HelperFunctions.launchLink(
                          context,
                          url: "https://gloryai.com",
                        );
                      },
                      title: 'Privacy Policy',
                      iconPath: null,
                    ),
                    AddHeight(0.008),
                    SettingsTile(
                      onTap: () {
                        BottomSheetsAndDialogs.deleteAccountDialog(context);
                      },
                      title: 'Delete Account',
                      iconPath: null,
                    ),
                    AddHeight(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2025 glory.ai All Rights Reserved',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                    AddHeight(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Glory.ai Version 1.0',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                      ],
                    ),
                    AddHeight(0.12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        // Existing decoration
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: SizedBox(
            height: height,
            width: width,
            child: homeScreens[activeWidget],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (activeWidget != 1 && activeWidget != 3 && activeWidget != 2) ...[
            GestureDetector(
              onTap: () {
                AppNavigation.navigateTo(AppRoutesNames.gloryBibleLinesScreen);
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
                      'Start Devotional',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AddHeight(0.03),
          ],
          if (activeWidget == 2) ...[
            GetBuilder<UserProvider>(
              builder: (value) {
                if (value.isUpdatingBibleVersion) {
                  return Center(child: CupertinoActivityIndicator());
                }
                return GestureDetector(
                  onTap:
                      _selectedIndex != null
                          ? () {
                            final UserProvider userProvider = Get.find();
                            userProvider.updateBibleVersion(
                              bibleBooks[_selectedIndex!].name,
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
                      color: DesignConstants.kTextGreenColor,
                      boxShadow: [
                        BoxShadow(
                          color: DesignConstants.kTextGreenColor.withOpacity(
                            0.4,
                          ),
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
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            AddHeight(0.03),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  activeWidget = 0;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 0
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.prayIconGlory),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 1;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 1
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(
                    imagePath: AppImages.calendarIconGlory,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 2;
                  print(activeWidget);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 2
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.bibleIconGlory),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  activeWidget = 3;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 3
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(
                    imagePath: AppImages.settingsIconGlory,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color:
                        activeWidget == 4
                            ? DesignConstants.kTextPurpleColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GloryAiAssetImage(imagePath: AppImages.shareIconGlory),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
