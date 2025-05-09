import 'package:flutter/material.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/utils/screen_helper.dart';

class CircularFindContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CircularFindContainer({
    required this.onTap,
    required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    final width = ScreenHelper.getScreenWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width * 0.85,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: DataConstants.kScreenHorizontalPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: DesignConstants.kTextLightColor,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
