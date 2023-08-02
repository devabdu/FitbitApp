import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPositionedButton extends StatelessWidget {
  const CustomPositionedButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSize.s40.h,
      right: AppSize.s40.w,
      left: AppSize.s40.w,
      child: child,
    );
  }
}
