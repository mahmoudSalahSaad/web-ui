import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/assets_manger.dart';
import 'package:flutter_web_task/core/theme/icon_manager.dart';
import 'package:flutter_web_task/features/widgets/appbar_tabs_widget.dart';

class DesktopTablrtAppBarContent extends StatelessWidget {
  const DesktopTablrtAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarTabs(),
          SizedBox(
            width: 24,
          ),
          Container(
            width: 1,
            height: 24,
            color: AppColors.dividerColor,
          ),
          SizedBox(
            width: 24,
          ),
          SvgPicture.asset(
            IconManager.settingSVG,
            color: Colors.white,
          ),
          SizedBox(
            width: 24,
          ),
          SvgPicture.asset(IconManager.notificationSVG),
          SizedBox(
            width: 24,
          ),
          Container(
            width: 1,
            height: 24,
            color: AppColors.dividerColor,
          ),
          SizedBox(
            width: 24,
          ),
          Image.asset(AssetsManger.profileImage1),
          SizedBox(
            width: 12,
          ),
          Text(
            "Johan Doe",
            style: TextStyle(
                color: AppColors.onPrimary, fontSize: 14, fontFamily: "inter"),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.keyboard_arrow_down, color: AppColors.onPrimary, size: 16),
        ],
      ),
    );
  }
}
