import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/gradient_icon.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/home_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/notification_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/profile_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/history_workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.lightPrimary,
              ),
            ],
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: AppElevation.e1_5,
            selectedItemColor: AppColors.lightPrimary,
            unselectedItemColor: AppColors.grey,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(AppIcons.homeFilled),
                label: titles[0],
                activeIcon: Column(
                  children: [
                    GradientIcon(
                      AppIcons.homeFilled,
                      AppSize.s26.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: AppSize.s2.h,
                    ),
                    GradientIcon(
                      AppIcons.solidBall,
                      AppSize.s8.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(AppIcons.notification),
                label: titles[1],
                activeIcon: Column(
                  children: [
                    GradientIcon(
                      AppIcons.notification,
                      AppSize.s26.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: AppSize.s2.h,
                    ),
                    GradientIcon(
                      AppIcons.solidBall,
                      AppSize.s8.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(AppIcons.editSquare),
                label: titles[2],
                activeIcon: Column(
                  children: [
                    GradientIcon(
                      AppIcons.editSquare,
                      AppSize.s26.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: AppSize.s2.h,
                    ),
                    GradientIcon(
                      AppIcons.solidBall,
                      AppSize.s8.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(AppIcons.personOutlined),
                label: titles[3],
                activeIcon: Column(
                  children: [
                    GradientIcon(
                      AppIcons.personOutlined,
                      AppSize.s26.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: AppSize.s2.h,
                    ),
                    GradientIcon(
                      AppIcons.solidBall,
                      AppSize.s8.r,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutesName.workouts_1Route);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: AppLinearGradientColors.mainColorButton,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s60.r)),
            ),
            child: Container(
              width: AppSize.s60.w,
              height: AppSize.s60.h,
              alignment: Alignment.center,
              child: const Icon(AppIcons.dummble),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
