import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_small.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_title_and_subtitle.dart';
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
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: CustomTextFormField(
            textEditingController: weightController,
            keyBoardType: TextInputType.number,
            hintText: AppStrings.yourWeight,
            labelText: AppStrings.yourWeight,
            prefixIcon: const Icon(AppIcons.weightOutlined),
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
            prefixIcon: const Icon(AppIcons.heightOutlined),
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
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
