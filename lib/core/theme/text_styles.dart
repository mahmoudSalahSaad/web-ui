import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/extensions/num_extensions.dart';

import '../responsive/responsive_layout.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle getStyle({
    required BuildContext context,
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: ResponsiveLayout.getFontSize(fontSize),
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.onBackground,
      height: height,
      fontFamily: "inter",
      decoration: decoration,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );
  }

  // Display styles
  static TextStyle displayLarge(BuildContext context) => getStyle(
        context: context,
        fontSize: 48.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      );

  static TextStyle displayMedium(BuildContext context) => getStyle(
        context: context,
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
      );

  // Heading styles
  static TextStyle h1(BuildContext context) => getStyle(
        context: context,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h2(BuildContext context) => getStyle(
        context: context,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h3(BuildContext context) => getStyle(
        context: context,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      );

  // Body text styles
  static TextStyle bodyLarge(BuildContext context) => getStyle(
        context: context,
        fontSize: 16.sp,
        height: 1.5,
      );

  static TextStyle bodyMedium(BuildContext context) => getStyle(
        context: context,
        fontSize: 14,
        fontWeight: FontWeight.w300,
        height: 1.4,
      );

  static TextStyle bodySmall(BuildContext context) => getStyle(
        context: context,
        fontSize: 12,
        height: 1.3,
      );

  // Button text styles
  static TextStyle buttonLarge(BuildContext context) => getStyle(
        context: context,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );

  static TextStyle buttonMedium(BuildContext context) => getStyle(
        context: context,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      );

  // Caption and overline
  static TextStyle caption(BuildContext context) => getStyle(
        context: context,
        fontSize: 12.h,
        letterSpacing: 0.4,
        color: AppColors.secondary,
      );

  static TextStyle overline(BuildContext context) => getStyle(
        context: context,
        fontSize: 10.h,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      );
}
