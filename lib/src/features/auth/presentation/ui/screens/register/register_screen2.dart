import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_measurement_text_form_field_widget.dart';
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
    return Image.asset(AppImagesPng.fitBoy2);
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
    return CustomTextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.successRegisterationRoute);
      },
      textButton: AppStrings.next,
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    double divideScreenFromHeightBy40 = mediaQuerySizeOfHeight / 40;
    double divideScreenFromHeightBy15 = mediaQuerySizeOfHeight / 15;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: Column(
            children: [
              _buildFitBoyImage(),
              SizedBox(height: divideScreenFromHeightBy15),
              _buildCenterText(),
              SizedBox(height: divideScreenFromHeightBy15),
              _buildGenderTextFormField(),
              SizedBox(height: divideScreenFromHeightBy40),
              _buildWeightTextFormField(),
              SizedBox(height: divideScreenFromHeightBy40),
              _buildHeightTextFormField(),
              SizedBox(height: divideScreenFromHeightBy15),
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
