import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
          borderRadius: const BorderRadius.all(
            Radius.circular(99),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
