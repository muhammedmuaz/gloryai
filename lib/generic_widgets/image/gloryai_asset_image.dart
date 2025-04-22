import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GloryAiAssetImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final double scale;
  final Color? color;

  final double? height, width;

  const GloryAiAssetImage({
    super.key,
    required this.imagePath,
    this.width,
    this.scale = 1,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        semanticsLabel: 'SVG Image',
        fit: fit,
        width: width,
        height: height,
        color: color,
        cacheColorFilter: true,
      );
    } else if (imagePath.toLowerCase().startsWith('/')) {
      return Image.file(
        File(imagePath),
        fit: fit,
        scale: scale,
        width: width,
        height: height,
        color: color,
      );
    } else if (imagePath.toLowerCase().endsWith('.png') ||
        imagePath.toLowerCase().endsWith('.jpg') ||
        imagePath.toLowerCase().endsWith('.jpeg') ||
        imagePath.toLowerCase().endsWith('.gif')) {
      return Image.asset(
        imagePath,
        fit: fit,
        scale: scale,
        color: color,
      );
    } else {
      return const Icon(
        Icons.error_outline,
      );
    }
  }
}
