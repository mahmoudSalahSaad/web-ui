import 'package:flutter/material.dart';


class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final double size;
  final Duration animationDuration;

  const ThemeSwitcher({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    this.size = 40,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onThemeChanged(!isDarkMode),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: AnimatedSwitcher(
              duration: animationDuration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                key: ValueKey<bool>(isDarkMode),
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: size * 0.6,
              ),
            ),
          ),
        ),
      );
  }
}

class BadgeIndicator extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double size;

  const BadgeIndicator({
    super.key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: text != null ? null : size,
      height: size,
      padding: text != null
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : null,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        shape: text != null ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: text != null ? BorderRadius.circular(size / 2) : null,
      ),
      child: text != null
          ? Text(
              text!,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }
}
