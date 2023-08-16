import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_rich_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/features/auth/presentation/screens/login/login_screen.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_compination_auth_icons_and_or_divider_widget.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_email_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReigsterScreen1 extends StatefulWidget {
  const ReigsterScreen1({super.key});

  @override
  State<ReigsterScreen1> createState() => _ReigsterScreen1State();
}

class _ReigsterScreen1State extends State<ReigsterScreen1>
    with RestorationMixin {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  RestorableBoolN checkboxValue = RestorableBoolN(false);

  @override
  String? get restorationId => 'checkbox_demo';
  final AppPharses appPharses = AppPharses();

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValue, 'checkbox');
  }

  @override
  void dispose() {
    checkboxValue.dispose();
    super.dispose();
  }

  Widget _buildWelcomeAndCreateAccountText(BuildContext context) {
    TextTheme themeTextStyle = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.heyThere,
          style: themeTextStyle.titleMedium,
        ),
        Text(
          AppStrings.createAccount,
          style: themeTextStyle.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildFirstNameTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _firstNameController,
      keyBoardType: TextInputType.name,
      prefixIcon: const Icon(
        AppIcons.personOutlined,
        color: AppColors.grey1,
      ),
      hintText: AppStrings.firstName,
      labelText: AppStrings.firstName,
    );
  }

  Widget _buildLineOfAcceptOurPrivacyAndTerms(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all<Color>(AppColors.lightPrimary),
          value: checkboxValue.value,
          onChanged: (value) {
            setState(() {
              checkboxValue.value = value;
            });
          },
        ),
        Expanded(
          child: Text(
            AppStrings.acceptOurPrivacyPolicyAndTerms,
            maxLines: AppCounts.c2,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppFontSize.s10.sp,
                  fontWeight: AppFontWeight.regular,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.register_2Route);
      },
      textButton: AppStrings.register,
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.alreadyHaveAccount,
      highlightText:
          appPharses.phraseConstructionWithFirstStringEmpty(AppStrings.login),
      nextWidget: const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: Column(
            children: [
              _buildWelcomeAndCreateAccountText(context),
              SizedBox(height: mediaQuerySizeOfHeight / 15),
              _buildFirstNameTextFormFiled(),
              SizedBox(height: mediaQuerySizeOfHeight / 30),
              BuildEmailTextFormField(textEditingController: _emailController),
              SizedBox(height: mediaQuerySizeOfHeight / 15),
              _buildLineOfAcceptOurPrivacyAndTerms(context),
              SizedBox(height: mediaQuerySizeOfHeight / 9),
              _buildRegisterButton(context),
              const BuildCombinationAuthIconsAndOrDividerWidget(),
              _buildAlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
