import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Add this import
import 'package:get/get.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/models/bible_books_model.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';

class SelectBibleVersion extends StatefulWidget {
  const SelectBibleVersion({super.key});

  @override
  State<SelectBibleVersion> createState() => _SelectBibleVersionState();
}

class _SelectBibleVersionState extends State<SelectBibleVersion> {
  int? _selectedIndex;
  final Duration _animationDuration = 300.ms;

  @override
  void initState() {
    // bibleVersion
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final UserProvider userProvider = Get.find();
      if (userProvider.userProfile != null) {
        for (var i = 0; i < bibleBooks.length; i++) {
          if (bibleBooks[i].name ==
              userProvider.userProfile!.bibleVersion!.toLowerCase()) {
            _selectedIndex = i;
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

    return SafeArea(
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
                        child: Icon(Icons.menu, color: Colors.white, size: 30),
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
                                          .fadeIn(duration: _animationDuration)
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

                    // Animated Confirm Button
                    // if (_selectedIndex != null) ...[
                    //   AddHeight(0.05),
                    //   SizedBox(
                    //     width: width * 0.6,
                    //     child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: DesignConstants.kTextPurpleColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(12),
                    //         ),
                    //         padding: EdgeInsets.symmetric(vertical: 16),
                    //         elevation: 4,
                    //         shadowColor: DesignConstants.kTextPurpleColor.withOpacity(0.3),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.pop(context, bibleBooks[_selectedIndex!]);
                    //       },
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             'Confirm Selection',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           SizedBox(width: 8),
                    //           Icon(Icons.arrow_forward, size: 20),
                    //         ],
                    //       ),
                    //     )
                    //     .animate()
                    //     .fadeIn(duration: 300.ms)
                    //     .slideY(begin: 0.5, end: 0),
                    //   ),
                    // ],
                    AddHeight(0.2),
                  ],
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
  
}
