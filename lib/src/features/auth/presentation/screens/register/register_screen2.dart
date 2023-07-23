import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_small.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_title_and_subtitle.dart';
import 'package:flutter/material.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final List<PopupMenuEntry<String>> _popupItems = [
    const CheckedPopupMenuItem(
      value: 'Male',
      checked: true,
      child: Text('Male'),
    ),
    const CheckedPopupMenuItem(
      value: 'Female',
      checked: false,
      child: Text('Female'),
    ),
  ];

  late String _selectedValue = '';

  final TextEditingController genderController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  Widget _buildFitBoyImage() {
    return SizedBox(
      width: 258,
      height: 243.56,
      child: Image.asset('assets/images/fit_boy2.png'),
    );
  }

  Widget _buildCenterText() {
    return const CustomTitleAndSubtitle(
      title: AppStrings.letsCompleteProfile,
      subTitle: AppStrings.itWillhelpUsToKnowAboutYOu,
    );
  }

  Widget _buildGenderTextFormField() {
    return CustomTextFormField(
      textEditingController: TextEditingController(text: _selectedValue),
      keyBoardType: TextInputType.text,
      prefixIcon: const Icon(Icons.people_outline),
      hintText: AppStrings.chooseGender,
      labelText: AppStrings.chooseGender,
      suffixIcon: PopupMenuButton<String>(
        icon: const Icon(Icons.keyboard_arrow_down),
        itemBuilder: (BuildContext context) => _popupItems,
        onSelected: (String selectedValue) {
          setState(() {
            _selectedValue = selectedValue;
          });
        },
      ),
      readOnly: true,
    );
  }

  Widget _buildWeightTextFormField() {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: CustomTextFormField(
            textEditingController: weightController,
            keyBoardType: TextInputType.number,
            hintText: AppStrings.yourWeight,
            labelText: AppStrings.yourWeight,
            prefixIcon: const Icon(Icons.monitor_weight_outlined),
          ),
        ),
        const Spacer(),
        const Expanded(
          flex: 2,
          child: CustomTextButtonSmall(title: AppStrings.kg),
        ),
      ],
    );
  }

  Widget _buildHeightTextFormField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: CustomTextFormField(
            textEditingController: heightController,
            keyBoardType: TextInputType.number,
            hintText: AppStrings.yourHeight,
            labelText: AppStrings.yourHeight,
            prefixIcon: const Icon(Icons.import_export_outlined),
          ),
        ),
        const Spacer(),
        const Expanded(
          flex: 2,
          child: CustomTextButtonSmall(title: AppStrings.cm),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.successRegisterationRoute);
      },
      textButton: AppStrings.next,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildFitBoyImage(),
                const SizedBox(
                  height: 45,
                ),
                _buildCenterText(),
                const SizedBox(
                  height: 75,
                ),
                _buildGenderTextFormField(),
                const SizedBox(
                  height: 18,
                ),
                _buildWeightTextFormField(),
                const SizedBox(
                  height: 18,
                ),
                _buildHeightTextFormField(),
                const SizedBox(
                  height: 54,
                ),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
