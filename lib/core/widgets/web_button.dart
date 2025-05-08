import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';

class DesktopButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final bool isLoading;
  final bool isOutlined;

  const DesktopButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48,
    this.isLoading = false,
    this.isOutlined = false,
  });

  @override
  State<DesktopButton> createState() => _DesktopButtonState();
}

class _DesktopButtonState extends State<DesktopButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        height: widget.height,
        child: widget.isOutlined
            ? OutlinedButton(
                onPressed: widget.isLoading ? null : widget.onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "inter"),
                  side: BorderSide(
                    color: widget.textColor ?? theme.primaryColor,
                    width: 2,
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: _buildButtonContent(),
              )
            : ElevatedButton.icon(
                label: _buildButtonContent(),
                onPressed: widget.isLoading ? null : widget.onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor:
                      _isHovered ? AppColors.stateColor : AppColors.primary,
                  foregroundColor: widget.textColor ?? AppColors.background,
                  elevation: _isHovered ? 4 : 2,
                ),
              ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 20,
            color: !_isHovered ? AppColors.background : AppColors.onPrimary,
          ),
          const SizedBox(width: 8),
          Text(
            widget.text,
            style: TextStyle(
                fontFamily: "inter",
                fontSize: 14,
                color: _isHovered ? AppColors.onPrimary : widget.textColor),
          ),
        ],
      );
    }

    return Text(
      widget.text,
      style: TextStyle(
          fontFamily: "inter",
          fontSize: 14,
          color: _isHovered ? AppColors.onPrimary : widget.textColor),
    );
  }
}
