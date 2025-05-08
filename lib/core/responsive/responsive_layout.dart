import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveLayout {

  static  Size _designSize = Size(375, 812);

    static final MediaQueryData _mediaQueryData =
      MediaQueryData.fromView(WidgetsBinding.instance.window);
  static bool isMobile() =>
      _mediaQueryData.size.width < 600;

  static bool isTablet() =>
     _mediaQueryData.size.width >= 600 &&
     _mediaQueryData.size.width < 1200;

  static bool isDesktop() =>
     _mediaQueryData.size.width >= 1200;

       static double scaleRadius() => min(scaleWidth(), scaleHeight());

  static double scaleText() => min(scaleWidth(), scaleHeight());

  static double getWidth() =>
     _mediaQueryData.size.width;

  static double getHeight() =>
     _mediaQueryData.size.height;

  static double getPaddingTop() =>
     _mediaQueryData.padding.top;

  static double getPaddingBottom() =>
     _mediaQueryData.padding.bottom;

  // Get responsive size based on screen width
  static double getResponsiveValue({
    required ,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final deviceWidth = getWidth();
    
    if (deviceWidth >= 1200) {
      _designSize =  Size(1440, 1024);
      return desktop ?? tablet ?? mobile;
    } else if (deviceWidth >= 600) {
      _designSize = Size(1024, 768);
      return tablet ?? mobile;
    } else {
      _designSize = Size(375, 812);
      return mobile;
    }
  }

    static Size _switchableDesignSize() {
    return _mediaQueryData.orientation == Orientation.portrait
        ? _designSize
        : const Size(716, 360);
  }


  // Get responsive font size
  static double getFontSize( double size) {
    final scale = getWidth() / 400; // baseline width
    final scaledSize = size * scale;
    return size * (scaledSize > size * 1.5 ? 1.5 : scale < 1 ? 1 : scale);
  }

  // Get responsive padding
  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop()) {
      return const EdgeInsets.all(24.0);
    } else if (isTablet()) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(12.0);
    }
  }
    static double availableScreenHeight({double ratio = 1}) =>
      (_mediaQueryData.size.height - _mediaQueryData.viewPadding.vertical) *
      ratio;
        static double availableScreenWidth({double ratio = 1}) =>
      (_mediaQueryData.size.width - _mediaQueryData.viewPadding.horizontal) *
      ratio;

    static double scaleWidth() =>
      availableScreenWidth() / _switchableDesignSize().width;

  static double scaleHeight() =>
      (
          availableScreenHeight()) /
      _switchableDesignSize().height;
}


