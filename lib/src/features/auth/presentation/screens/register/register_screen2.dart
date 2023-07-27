import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_small.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_measurement_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: AppSize.s258.w,
      height: AppSize.s243_56.h,
      child: Image.asset(AppImagesPng.fitBoy2),
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
      prefixIcon: const Icon(AppIcons.peoplepOutline),
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
    return BuildMeasurementTextFormField(
      textEditingController: weightController,
      hintAndLabelText: AppStrings.yourWeight,
      prefixIcon: AppIcons.weightOutlined,
      textButton: AppStrings.kg,
    );
  }

  Widget _buildHeightTextFormField() {
    return BuildMeasurementTextFormField(
      textEditingController: heightController,
      hintAndLabelText: AppStrings.yourHeight,
      prefixIcon: AppIcons.heightOutlined,
      textButton: AppStrings.cm,
    );
  }

  Widget _buildNextButton(BuildContext context) {
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
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildFitBoyImage(),
                SizedBox(
                  height: AppSize.s45.h,
                ),
                _buildCenterText(),
                SizedBox(
                  height: AppSize.s75.h,
                ),
                _buildGenderTextFormField(),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                _buildWeightTextFormField(),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                _buildHeightTextFormField(),
                SizedBox(
                  height: AppSize.s54.h,
                ),
                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
