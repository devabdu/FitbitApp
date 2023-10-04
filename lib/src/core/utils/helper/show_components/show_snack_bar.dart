import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.darkPrimary,
      duration: const Duration(seconds: 5),
    ),
  );
}
