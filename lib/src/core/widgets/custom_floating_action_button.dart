import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {super.key, required this.iconWidget, required this.nextRoutName});

  final String nextRoutName;
  final Icon iconWidget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, nextRoutName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s60.r)),
        ),
        padding: const EdgeInsets.all(AppPadding.p5),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppLinearGradientColors.mainGradientColor,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s99.r)),
        ),
        child: Container(
          width: AppSize.s60.w,
          height: AppSize.s50.h,
          alignment: Alignment.center,
          child: iconWidget,
        ),
      ),
    );
  }
}
