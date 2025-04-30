import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/utils/screen_helper.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? iconPath;
  const SettingsTile({
    required this.title,
    required this.iconPath,
    super.key});

  @override
  Widget build(BuildContext context) {
    final width = ScreenHelper.getScreenWidth(context);
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 1, color: DesignConstants.kTextLightColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: width * 0.01),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconPath!=null ?
                GloryAiAssetImage(
                  imagePath: iconPath!,
                  height: 21,
                  width: 21,
                ): SizedBox(width: 21,
                height: 21,),
                SizedBox(width: 21),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 13,
            color: DesignConstants.kTextLightColor,
          ),
          SizedBox(width: width * 0.02),
        ],
      ),
    );
  }
}
