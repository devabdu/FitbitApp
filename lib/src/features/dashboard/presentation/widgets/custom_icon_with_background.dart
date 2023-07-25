import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconWithBackground extends StatelessWidget {
  const CustomIconWithBackground({
    super.key,
    required this.child,
    this.backgroundColor,
    this.isWithOutBackGroundColor = false,
  });

  final Widget child;
  final Color? backgroundColor;
  final bool isWithOutBackGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppPadding.p6.w),
      decoration: BoxDecoration(
        color: isWithOutBackGroundColor
            ? backgroundColor
            : AppColors.backGroundCircleAvatar,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s14.r),
        ),
      ),
      child: child,
    );
  }
}
