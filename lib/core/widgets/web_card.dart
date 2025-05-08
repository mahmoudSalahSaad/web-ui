import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../animations/scale_animation.dart';

class DesktopCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final double elevation;
  final VoidCallback? onTap;
  final bool animate;
  final BorderRadius? borderRadius;
  final bool hoverable;

  const DesktopCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.elevation = 1,
    this.onTap,
    this.animate = true,
    this.borderRadius,
    this.hoverable = true,
  });

  @override
  State<DesktopCard> createState() => _DesktopCardState();
}

class _DesktopCardState extends State<DesktopCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.hoverable ? setState(() => _isHovered = true) : null,
      onExit: (_) => widget.hoverable ? setState(() => _isHovered = false) : null,
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 150),
          beginScale: 1.0,
          endScale: _isHovered && widget.animate ? 1.02 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Theme.of(context).cardColor,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(_isHovered ? 0.2 : 0.1),
                  blurRadius: _isHovered ? widget.elevation * 4 : widget.elevation * 2,
                  offset: Offset(0, _isHovered ? 4 : 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
              child: Padding(
                padding: widget.padding,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

