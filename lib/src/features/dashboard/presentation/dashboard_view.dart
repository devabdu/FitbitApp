import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/home_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/notification_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/profile_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/workouts_screen.dart';
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
    const WorkoutsScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'home',
    'notification',
    'workouts',
    'profile',
  ];

  var _title = 'home';
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
            selectedItemColor: AppColors.lightPrimary,
            unselectedItemColor: AppColors.grey,
            currentIndex: _currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: titles[0],
                activeIcon: const Column(
                  children: [
                    GradientIcon(
                      Icons.home_filled,
                      24.0,
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
        floatingActionButton: const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.lightPrimary,
          child: Icon(
            Icons.fitness_center_outlined,
            color: AppColors.white,
            //size: AppSize.s24,
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
