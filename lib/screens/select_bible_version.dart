import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/utils/screen_helper.dart';

class SelectBibleVersion extends StatefulWidget {
  const SelectBibleVersion({super.key});

  @override
  State<SelectBibleVersion> createState() => _SelectBibleVersionState();
}

class _SelectBibleVersionState extends State<SelectBibleVersion> {
  @override
  void initState() {
    super.initState();
    // _selectedDay = _currentDate.day;
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
            // AddHeight(0.1),
            Text(
              'Biblical Gospels and versions',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: DesignConstants.kTextPurpleColor,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              'The New Testament contains four canonical gospels that narrate the life and teachings of Jesus Christ:',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DesignConstants.kTextPurpleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
