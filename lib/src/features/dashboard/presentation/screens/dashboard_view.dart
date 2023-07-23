import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/home_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/notification_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/profile_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/history_workouts_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/gradient_icon.dart';
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
            elevation: 1.5,
            selectedItemColor: AppColors.lightPrimary,
            unselectedItemColor: AppColors.grey,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: titles[0],
                activeIcon: const Column(
                  children: [
                    GradientIcon(
                      Icons.home_filled,
                      26.0,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    GradientIcon(
                      Icons.lens,
                      AppSize.s8,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.photo_filter_rounded),
                label: titles[1],
                activeIcon: const Column(
                  children: [
                    GradientIcon(
                      Icons.photo_filter_rounded,
                      26.0,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    GradientIcon(
                      Icons.lens,
                      AppSize.s8,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.edit_square),
                label: titles[2],
                activeIcon: const Column(
                  children: [
                    GradientIcon(
                      Icons.edit_square,
                      26.0,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    GradientIcon(
                      Icons.lens,
                      AppSize.s8,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                label: titles[3],
                activeIcon: const Column(
                  children: [
                    GradientIcon(
                      Icons.person_outline,
                      26.0,
                      AppLinearGradientColors.iconBottomNavigation,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    GradientIcon(
                      Icons.lens,
                      AppSize.s8,
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
            decoration: const BoxDecoration(
              gradient: AppLinearGradientColors.mainColorButton,
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: const Icon(Icons.fitness_center_outlined),
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
