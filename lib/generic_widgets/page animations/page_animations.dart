





// Add this custom clipper class:
import 'dart:ui';

import 'package:flutter/material.dart';

class CircleRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset center;

  CircleRevealClipper({required this.fraction, required this.center});

  @override
  Path getClip(Size size) {
    final radius = fraction * size.longestSide * 1.5;
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
