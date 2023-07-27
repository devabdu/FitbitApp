import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:flutter/material.dart';

class BuildEmailTextFormField extends StatelessWidget {
  const BuildEmailTextFormField(
      {super.key, required this.textEditingController});
  final TextEditingController textEditingController;
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
        labelText: AppStrings.email
        //errorText: 'Error',
        );
  }
}
