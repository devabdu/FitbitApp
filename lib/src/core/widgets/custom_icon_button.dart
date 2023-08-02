import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String assetImage;
  final Color? containerColor;

  const CustomIconButton({
    super.key,
    this.onTap,
    required this.assetImage,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: containerColor,
        width: AppSize.s45.w,
        height: AppSize.s45.h,
        decoration: BoxDecoration(
          border: Border.all(
            //width: 0.8,
            color: AppColors.grey3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s16.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: SvgPicture.asset(
            assetImage,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
