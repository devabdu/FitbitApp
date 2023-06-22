import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String assetImage;
  final Color? containerColor;

  const CustomIconButton({
    super.key,
    this.onTap,
    required this.assetImage,
    this.containerColor,
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
          child: SvgPicture.asset(
            assetImage,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
