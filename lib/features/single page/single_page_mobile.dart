import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_task/core/extensions/num_extensions.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/assets_manger.dart';
import 'package:flutter_web_task/core/theme/icon_manager.dart';
import 'package:flutter_web_task/core/widgets/web_app_bar.dart';
import 'package:flutter_web_task/features/single%20page/single_page_desktop.dart';
import 'package:flutter_web_task/features/widgets/mobile_appbar_content.dart';

class SinglePageMobile extends StatefulWidget {
  const SinglePageMobile({super.key});

  @override
  State<SinglePageMobile> createState() => _SinglePageMobileState();
}

class _SinglePageMobileState extends State<SinglePageMobile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(
        isMobile: true,
        title: SvgPicture.asset(AssetsManger.logo),
        actions: [
          MobileAppBarContent(),
        ],
        leading: SvgPicture.asset(
          IconManager.menuSvg,
          color: AppColors.onPrimary,
        ),
        backgroundColor: AppColors.background,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.onPrimaryContainer),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 16,
            runSpacing: 20,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            children: List.generate(
                8,
                (index) => TourCard(
                      isMobile: true,
                    )),
          ),
        ),
      ),
    );
  }
}
