import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTimerControl extends StatelessWidget {
  const CustomTimerControl(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.titleOfControl});

  final void Function()? onPressed;
  final IconData icon;
  final String titleOfControl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppPadding.p10.h),
          child: Container(
            width: AppSize.s70.w,
            height: AppSize.s70.h,
            decoration: const BoxDecoration(
              color: AppColors.backGroundCircleAvatar,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
            ),
          ),
        ),
        Text(titleOfControl),
      ],
    );
  }
}
