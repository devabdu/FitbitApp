import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String message;

  CustomSnackBar({
    super.key,
    required this.message,
  }) : super(content: Text(message), backgroundColor: AppColors.black);
}
