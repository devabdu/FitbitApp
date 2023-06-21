import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final String hintText;
  final String labelText;
  final Icon prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.keyBoardType,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        //errorText: 'Error',
      ),
    );
  }
}
