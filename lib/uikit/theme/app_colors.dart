import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color dipeDive = Color(0xFF10273D);

  static const Color background = Color(0xFFF2F4F8);

  static const Color dividers = Color(0xFFE8ECF0);
  static const Color breakWater = Color(0xFF173B57);

  static const Color tiffany = Color(0xFF04CCD9);
  static const tiffanyBackground = Color(0xFFE6FAFB);

  static const Color lightTiffany = Color(0x1A04CCD9);

  static const grey = Color(0xFF818E99);
  static const greyLight = Color(0xFFC2C7CD);
  static const lightGray = Color(0xffe3e3e3);

  static const Color white = Color(0xFFFFFFFF);

  static const Color input = Color(0xFFDCE0E3);

  static const Color red = Color(0xFFEE3D48);
  static const redBackground = Color(0xFFFDECED);

  static const Color blueSapphire = Color(0xFF0D6579);

  static const Color disabledDotIndicator = Color(0xFFD9D9D9);

  static const Color bluishGrey = Color(0xFFE8ECF0);

  static const Color skeletonGradientEnd = Color(0x1AFFFFFF);

  static const Color tooltipBoxShadow = Color(0x2610273D);

  static const Color turquolse = Color(0xFFFFC11E);
  static const turquolseBacground = Color(0xFFFFF0E5);
  static const Color blue = Color(0xFF007AFF);

  static const Color splashBackground = Color(0xFFF3F3F3);
  static const Color greyBackground = Color(0xFFE5E9EE);

  static const Color blueBackground = Color(0xFFebf2fd);

  static const chartColors = ChartColors(
    linesColor: Color(0xFFF3F5F7),
  );

  static const skeletonGradientWhiteToGrey = LinearGradient(
    colors: [
      white,
      skeletonGradientEnd,
    ],
  );

  static const skeletonGradientGreyToWhite = LinearGradient(
    colors: [
      background,
      white,
    ],
  );

  static const shimmerWhiteGradient = LinearGradient(
    colors: [
      AppColors.white,
      AppColors.background,
    ],
    stops: [0.2, 0.4],
    begin: Alignment(-0.5, 0),
  );

  static const shimmerGreyGradient = LinearGradient(
    colors: [
      AppColors.skeletonGradientEnd,
      AppColors.white,
    ],
    stops: [0.4, 0.6],
    begin: Alignment(-0.5, 0),
  );
}

class ChartColors {
  const ChartColors({required this.linesColor});
  final Color linesColor;
}
