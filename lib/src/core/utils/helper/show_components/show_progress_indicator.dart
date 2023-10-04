import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:flutter/material.dart';

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: AppColors.transparent,
    elevation: AppElevation.e0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkPrimary),
      ),
    ),
  );
  showDialog(
    barrierColor: AppColorsWithOpacity.whiteOfZero,
    barrierDismissible: false,
    context: context,
    builder: (context) => alertDialog,
  );
}
