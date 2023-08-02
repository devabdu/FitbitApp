import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_floating_action_button.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/home_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/notification_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/profile_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/history_workouts_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_navigation_bar_item_widget.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
    HistoryWorkoutsScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    AppStrings.home,
    AppStrings.notification,
    AppStrings.workouts,
    AppStrings.profile,
  ];

  String _title = AppStrings.home;
  var _currentIndex = 0;

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }

  Widget _buildFloationgActionButton() {
    return const CustomFloatingActionButton(
      iconWidget: Icon(AppIcons.dummble),
      nextRoutName: AppRoutesName.workouts_1Route,
    );
  }

  Widget _buildBottomNavigationBar() {
    List<CustomBottomNavigationBarItem> bottomNavigationBarItems = [
      CustomBottomNavigationBarItem(
          title: titles[0], iconData: AppIcons.homeFilled),
      CustomBottomNavigationBarItem(
          title: titles[1], iconData: AppIcons.notification),
      CustomBottomNavigationBarItem(
          title: titles[2], iconData: AppIcons.editSquare),
      CustomBottomNavigationBarItem(
          title: titles[3], iconData: AppIcons.personOutlined),
    ];
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: AppElevation.e1_5,
      selectedItemColor: AppColors.lightPrimary,
      unselectedItemColor: AppColors.grey2,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: bottomNavigationBarItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
        floatingActionButton: _buildFloationgActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
