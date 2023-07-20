import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButtonLarge extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  double? width;
  double? height;

  CustomTextButtonLarge({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        padding: const EdgeInsets.all(0),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: AppLinearGradientColors.mainColorButton,
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        child: Container(
          width: width ?? 315,
          height: height ?? 60,
          alignment: Alignment.center,
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: AppFontSize.s18,
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
