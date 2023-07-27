import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextButtonLarge extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  double? width;
  double? height;

  CustomTextButtonLarge({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s99.r)),
        ),
        padding: const EdgeInsets.all(AppPadding.p0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppLinearGradientColors.mainColorButton,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s99.r)),
        ),
        child: Container(
          width: width ?? AppSize.s315.w,
          height: height ?? AppSize.s60.h,
          alignment: Alignment.center,
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: AppFontSize.s18,
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
