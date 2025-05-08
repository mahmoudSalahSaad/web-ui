import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_task/core/extensions/num_extensions.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/assets_manger.dart';
import 'package:flutter_web_task/core/theme/icon_manager.dart';
import 'package:flutter_web_task/core/widgets/web_app_bar.dart';
import 'package:flutter_web_task/features/widgets/desktop_tablet_content.dart';

class SinglePageDesktop extends StatefulWidget {
  const SinglePageDesktop({super.key});

  @override
  State<SinglePageDesktop> createState() => _SinglePageDesktopState();
}

class _SinglePageDesktopState extends State<SinglePageDesktop>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(
        isMobile: false,
        title: SvgPicture.asset(AssetsManger.logo),
        actions: [
          DesktopTablrtAppBarContent(),
        ],
        leading: SizedBox(),
        backgroundColor: AppColors.background,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.onPrimaryContainer),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (index, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 1200
                    ? 110.w
                    : constraints.maxWidth < 600
                        ? 16.w
                        : constraints.maxWidth < 1200
                            ? 40.w
                            : 80.w,
                vertical: 36),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 20,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              children: List.generate(
                  8,
                  (index) => TourCard(
                        isMobile: false,
                      )),
            ),
          );
        }),
      ),
    );
  }
}

class TourCard extends StatelessWidget {
  const TourCard({
    super.key,
    required this.isMobile,
  });
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 343.w : 244,
      height: isMobile ? 314.h : 320,
      decoration: BoxDecoration(
        color: AppColors.onBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 182,
                decoration: BoxDecoration(
                  color: AppColors.onPrimaryContainer,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(AssetsManger.bg1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 182,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      AppColors.onBackground,
                      AppColors.onBackground,
                    ],
                    stops: const [0.0, 0.5, 0.99, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.background.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      IconManager.moreSvg,
                      color: AppColors.highLightTextColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 8,
                child: Container(
                  width: 156,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.stateColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(color: AppColors.stateColor, width: 1)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pending Aproval',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down,
                            size: 16, color: AppColors.onPrimary),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.onPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        IconManager.calendarSvg,
                        color: AppColors.textColor,
                      ),
                      Text(
                        "Jan 16 - Jan 20, 2024",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        child: AnimatedAvatarStack(
                          borderWidth: 0,
                          infoWidgetBuilder: (surplus, context) => Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.onPrimaryContainer,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.onPrimaryContainer,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "+$surplus",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          height: 20,
                          avatars: [
                            NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                                scale: 0.5),
                            NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXwAEgxoTU_a4KLmpfT0BbUm2XDrICPJVSqUEp85SMF79vNKqPIDvO7o0J98nXd5bRUV0&usqp=CAU',
                                scale: 0.5),
                            NetworkImage(
                                'data:image/jpeg;base64,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',
                                scale: 0.5),
                            NetworkImage(
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&psig=AOvVaw2tWEzb92wokV9RmNPDHfby&ust=1746782652205000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPDM1M3Gk40DFQAAAAAdAAAAABAJ',
                                scale: 0.5),
                            NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D1',
                                scale: 0.5),
                            NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D2',
                                scale: 0.5),
                          ],
                        ),
                      ),
                      Text(
                        "4 unfinished tasks",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
