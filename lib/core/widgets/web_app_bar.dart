import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/extensions/num_extensions.dart';

import '../theme/app_colors.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;
  final double toolbarHeight;
  final bool isMobile;

  const DesktopAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.toolbarHeight = 64,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: elevation!,
                ),
              ]
            : null,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: toolbarHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth > 1200
                        ? 120.w
                        : constraints.maxWidth < 600
                            ? 16.w
                            : constraints.maxWidth < 1200
                                ? 40.w
                                : 80.w,
                    vertical: 0),
                child: Row(
                  children: [
                    if (leading != null) ...[
                      leading!,
                      const SizedBox(width: 16),
                    ],
                    if (!centerTitle) ...[
                      title,
                      const Spacer(),
                    ],
                    if (centerTitle) ...[
                      const Spacer(),
                      title,
                      const Spacer(),
                    ],
                    if (actions != null) ...[
                      ...actions!.map((action) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: action,
                          )),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth > 1200
                        ? 110.w
                        : constraints.maxWidth < 600
                            ? 16.w
                            : constraints.maxWidth < 1200
                                ? 40.w
                                : 80.w,
                  ),
                  color: AppColors.onPrimaryContainer),
            )
          ],
        );
      }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        toolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}
