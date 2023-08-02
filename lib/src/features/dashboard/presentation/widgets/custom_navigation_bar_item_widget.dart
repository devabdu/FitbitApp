import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  final String title;
  final IconData iconData;

  CustomBottomNavigationBarItem({
    required this.title,
    required this.iconData,
  }) : super(
          icon: Icon(
            iconData,
          ),
          label: title,
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientIcon(
                iconData,
                AppSize.s24.r,
                AppLinearGradientColors.iconBottomNavigation,
              ),
              SizedBox(
                height: AppSize.s1.h,
              ),
              GradientIcon(
                AppIcons.solidBall,
                AppSize.s8.r,
                AppLinearGradientColors.iconBottomNavigation,
              ),
            ],
          ),
        );
}
