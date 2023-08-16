import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildOrDividerSubWidget extends StatelessWidget {
  const BuildOrDividerSubWidget({super.key});

  Widget _buildContainer() {
    return Container(
      width: AppSize.s130.w,
      height: AppSize.s1.h,
      color: AppColors.grey3,
    );
  }

  Widget _buildOrText(BuildContext context) {
    return Text(
      AppStrings.or,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildContainer(),
        _buildOrText(context),
        _buildContainer(),
      ],
    );
  }
}
