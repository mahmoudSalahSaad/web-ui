import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_task/core/theme/app_colors.dart';
import 'package:flutter_web_task/core/theme/assets_manger.dart';
import 'package:flutter_web_task/core/theme/icon_manager.dart';
import 'package:flutter_web_task/core/theme/text_styles.dart';
import 'package:flutter_web_task/core/widgets/web_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web UI Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const SinglePage();
        } else if (constraints.maxWidth < 1200) {
          return const SinglePage();
        } else {
          return const SinglePage();
        }
      },
    );
  }
}

class SinglePage extends StatefulWidget {
  const SinglePage({super.key});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(
        title: "",
        actions: [
          Center(
            child: Row(
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
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(color: AppColors.onPrimary),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.keyboard_arrow_down,
                    color: AppColors.onPrimary, size: 16),
              ],
            ),
          ),
        ],
        leading: SvgPicture.asset(AssetsManger.logo),
        backgroundColor: AppColors.background,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.onPrimaryContainer),
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }
}

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
