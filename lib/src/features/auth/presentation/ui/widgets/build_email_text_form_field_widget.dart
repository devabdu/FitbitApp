import 'package:fitbit/src/core/utils/functions/valid_functions.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildEmailTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  late String email;

  BuildEmailTextFormField(
      {super.key, required this.textEditingController, required this.email});
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textEditingController: textEditingController,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        AppIcons.emailOutlined,
        color: AppColors.grey1,
      ),
      hintText: AppStrings.email,
      labelText: AppStrings.email,
      validator: (value) => Validator.validateEmail(value),
      onSaved: (newValue) => email = newValue!,
      //errorText: 'Error',
    );
  }
}
