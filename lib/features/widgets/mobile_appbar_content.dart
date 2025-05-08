import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/assets_manger.dart';
import 'package:flutter_web_task/core/theme/icon_manager.dart';

class MobileAppBarContent extends StatelessWidget {
  const MobileAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}
