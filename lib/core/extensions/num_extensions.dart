import 'package:flutter_web_task/core/responsive/responsive_layout.dart';


extension SizeExtension on num {
  double get w => ResponsiveLayout.scaleWidth() * this;

  double get h => ResponsiveLayout.scaleHeight() * this;

  double get r => ResponsiveLayout.scaleRadius() * this;

  double get sp => ResponsiveLayout.scaleText() * this;
}
