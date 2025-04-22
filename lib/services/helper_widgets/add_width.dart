import 'package:flutter/material.dart';
import 'package:gloryai/utils/screen_helper.dart';

class AddWidth extends StatelessWidget {
  final double percentage;
  const AddWidth(
    this.percentage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.getScreenWidth(context) * percentage,
    );
  }
}