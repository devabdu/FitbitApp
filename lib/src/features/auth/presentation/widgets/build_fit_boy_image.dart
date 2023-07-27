import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFitBoyImage extends StatelessWidget {
  const BuildFitBoyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s308_03.w,
      height: AppSize.s236_49.h,
      child: Image.asset(AppImagesPng.fitBoy3),
    );
  }
}
