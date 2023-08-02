import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButtonSmall extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? containerColor;

  const CustomTextButtonSmall({
    super.key,
    this.onTap,
    this.containerColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: containerColor,
        width: AppSize.s40.w,
        height: AppSize.s40.h,
        decoration: BoxDecoration(
          gradient: AppLinearGradientColors.mainGradientColor,
          border: Border.all(
            color: AppColors.grey3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s14.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p10.r),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
