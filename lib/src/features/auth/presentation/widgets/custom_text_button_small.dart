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
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.darkPrimary,
              AppColors.lightPrimary,
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
          border: Border.all(
            //width: 0.8,
            color: AppColors.grey3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
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
