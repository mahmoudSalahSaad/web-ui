import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/text_styles.dart';
import 'package:flutter_web_task/features/widgets/tab_item_widget.dart';

class AppBarTabs extends StatefulWidget {
  const AppBarTabs({
    super.key,
  });

  @override
  State<AppBarTabs> createState() => _AppBarTabsState();
}

class _AppBarTabsState extends State<AppBarTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 368,
      child: TabBar(
          controller: _tabController,
          onTap: (value) {
            print(value);
            _tabController.index = value;
            setState(() {});
          },
          labelPadding:
              EdgeInsets.only(top: 4, left: _tabController.index == 5 ? 0 : 32),
          tabAlignment: TabAlignment.center,
          isScrollable: false,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2,
          labelColor: AppColors.onPrimary,
          dividerColor: AppColors.primary.withOpacity(0),
          unselectedLabelColor: AppColors.textColor,
          labelStyle: AppTextStyles.bodyMedium(context)
              .copyWith(color: AppColors.onPrimary),
          unselectedLabelStyle: AppTextStyles.bodyMedium(context)
              .copyWith(color: AppColors.textColor),
          tabs: [
            TabItemWidget(
              title: "Items",
              isSelected: _tabController.index == 0,
            ),
            // SizedBox(
            //   width: 32,
            // ),
            TabItemWidget(
              title: "Pricing",
              isSelected: _tabController.index == 1,
            ),
            // SizedBox(
            //   width: 32,
            // ),
            TabItemWidget(
              title: "Info",
              isSelected: _tabController.index == 2,
            ),
            // SizedBox(
            //   width: 32,
            // ),
            TabItemWidget(
              title: "Tasks",
              isSelected: _tabController.index == 3,
            ),
            // SizedBox(
            //   width: 32,
            // ),
            TabItemWidget(
              title: "Analytics",
              isSelected: _tabController.index == 4,
            ),
          ]),
    );
  }
}
