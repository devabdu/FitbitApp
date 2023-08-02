import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetUtils {
  static void showCustomBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.all(AppPadding.p24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [child],
            ),
          ),
        );
      },
    );
  }
}
