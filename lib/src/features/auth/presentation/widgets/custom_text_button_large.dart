import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

class CustomTextButtonLarge extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  const CustomTextButtonLarge({
    super.key,
    required this.textButton,
    required this.onPressed,
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
          gradient: LinearGradient(
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
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        child: Container(
          width: 315,
          height: 60,
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
