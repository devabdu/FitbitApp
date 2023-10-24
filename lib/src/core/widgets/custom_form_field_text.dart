import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final String hintText;
  final String labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool readOnly;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.keyBoardType,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.readOnly = false,
    this.obscureText,
    this.validator,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyBoardType,
      obscureText: obscureText ?? false,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        //errorText: 'Error',
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
