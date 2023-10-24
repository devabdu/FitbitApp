import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_small.dart';
import 'package:flutter/material.dart';

class BuildMeasurementTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintAndLabelText;
  final IconData prefixIcon;
  final String textButton;
  final Function(String?)? onSaved;

  const BuildMeasurementTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintAndLabelText,
    required this.prefixIcon,
    required this.textButton,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: CustomTextFormField(
            textEditingController: textEditingController,
            keyBoardType: TextInputType.number,
            hintText: hintAndLabelText,
            labelText: hintAndLabelText,
            prefixIcon: Icon(prefixIcon),
            onSaved: onSaved,
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: CustomTextButtonSmall(title: textButton),
        ),
      ],
    );
  }
}
