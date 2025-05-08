import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';

class TabItemWidget extends StatefulWidget {
  const TabItemWidget(
      {super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;
  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.isSelected
                    ? AppColors.onPrimary
                    : isHovered
                        ? AppColors.onPrimary
                        : AppColors.textColor,
                fontSize: isHovered ? 14 : 14,
                fontFamily: "inter"),
          ),
        ),
      ),
    );
  }
}
