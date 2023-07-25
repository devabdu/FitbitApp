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
        //  width: 60,
        //  height: 60,
        decoration: BoxDecoration(
          gradient: AppLinearGradientColors.mainColorButton,
          border: Border.all(
            //width: 0.8,
            color: AppColors.grey3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s99.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
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
