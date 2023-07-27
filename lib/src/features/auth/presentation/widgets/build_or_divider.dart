import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildOrDivider extends StatelessWidget {
  const BuildOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: AppSize.s141.w,
          height: AppSize.s1.h,
          color: Colors.grey,
        ),
        Text(
          AppStrings.or,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: AppSize.s141.w,
          height: AppSize.s1.h,
          color: Colors.grey,
        ),
      ],
    );
  }
}
