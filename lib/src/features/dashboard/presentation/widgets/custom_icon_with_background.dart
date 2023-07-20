import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconWithBackground extends StatelessWidget {
  const CustomIconWithBackground({
    super.key,
    required this.child,
    this.backgroundColor,
    this.isWithOutBackGroundColor = false,
  });

  final Widget child;
  final Color? backgroundColor;
  final bool isWithOutBackGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isWithOutBackGroundColor
            ? backgroundColor
            : AppColors.backGroundCircleAvatar,
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: child,
    );
  }
}
