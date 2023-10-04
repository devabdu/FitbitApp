import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsTextButton extends CustomTextButton {
  const WorkoutsTextButton({
    super.key,
    required super.textButton,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: AppSize.s80.w,
      height: AppSize.s40.h,
      textButton: super.textButton,
      onPressed: super.onPressed,
    );
  }
}
