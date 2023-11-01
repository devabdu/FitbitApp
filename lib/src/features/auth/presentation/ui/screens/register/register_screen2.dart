import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitbit/src/app/dependency_injection.dart';
import 'package:fitbit/src/core/utils/functions/valid_functions.dart';
import 'package:fitbit/src/core/utils/helper/navigator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_progress_indicator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_snack_bar.dart';
import 'package:fitbit/src/core/utils/resources/app_assets.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/register_controller/register_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/user_controller/user_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/success_registeration_screen.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_measurement_text_form_field_widget.dart';

class RegisterScreen2 extends StatefulWidget {
  final String userId;
  const RegisterScreen2({required this.userId, super.key});

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

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _genderController;
  late final TextEditingController _weightController;
  late final TextEditingController _heightController;

  late final String _selectedValue = '';
  late String gender;
  late String weight;
  late String height;
  @override
  void initState() {
    _genderController = TextEditingController();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _genderController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

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
      textEditingController: _genderController,
      keyBoardType: TextInputType.text,
      prefixIcon: const Icon(AppIcons.peoplepOutline),
      hintText: AppStrings.chooseGender,
      labelText: AppStrings.chooseGender,
      suffixIcon: PopupMenuButton<String>(
        icon: const Icon(Icons.keyboard_arrow_down),
        itemBuilder: (BuildContext context) => _popupItems,
        onSelected: (selectedValue) {
          setState(() {
            gender = selectedValue;
          });
        },
      ),
      validator: (value) => Validator.validateGender(value),
      onSaved: (newValue) => gender = newValue!,
    );
  }

  Widget _buildWeightTextFormField() {
    return BuildMeasurementTextFormField(
      textEditingController: _weightController,
      hintAndLabelText: AppStrings.yourWeight,
      prefixIcon: AppIcons.weightOutlined,
      onSaved: (newValue) => weight = newValue!,
      textButton: AppStrings.kg,
    );
  }

  Widget _buildHeightTextFormField() {
    return BuildMeasurementTextFormField(
      textEditingController: _heightController,
      hintAndLabelText: AppStrings.yourHeight,
      prefixIcon: AppIcons.heightOutlined,
      onSaved: (newValue) => height = newValue!,
      textButton: AppStrings.cm,
    );
  }

  Widget _buildCreateUserInfoSubmitedBloc() {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is CreateUserInfoLoading) {
          showProgressIndicator(context);
        }
        if (state is CreateUserInfoSuccess) {
          navigatePop(context);
          navigateTo(
              context,
              BlocProvider(
                  create: (_) => serviceLocator<UserCubit>()
                    ..getUserInfo(uid: widget.userId),
                  child: const SuccessRegisterationScreen()));
        }
        if (state is CreateUserInfoError) {
          String message = (state).error;
          showSnackBar(context, message);
        }
      },
      child: Container(
        height: AppSize.s45,
      ),
    );
  }

  Future<void> _checkValidateCreateUserInfo(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<RegisterCubit>(context).createUserInfo(
        uid: widget.userId,
        gender: gender,
        weight: double.parse(weight.toString()),
        height: double.parse(height.toString()),
      );
    }
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () => _checkValidateCreateUserInfo(context),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                _buildCreateUserInfoSubmitedBloc(),
                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
