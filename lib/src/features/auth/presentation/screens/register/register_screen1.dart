import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_rich_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/screens/login/login_screen.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_email_text_form_field.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_gmail_facebook_icons_sections.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_or_divider.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.heyThere,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.title),
        ),
        Text(
          AppStrings.createAccount,
          style: Theme.of(context).textTheme.bodyLarge,
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
            //overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppFontSize.s12,
                  fontWeight: AppFontWeight.regular,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.register_2Route);
      },
      textButton: AppStrings.register,
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return const CustomRichText(
      mainText: AppStrings.alreadyHaveAccount,
      highlightText: AppStrings.login,
      nextWidget: LoginScreen(),
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
                _buildWelcomeAndCreateAccountText(context),
                SizedBox(
                  height: AppSize.s45.h,
                ),
                _buildFirstNameTextFormFiled(),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildEmailTextFormField(
                    textEditingController: _emailController),
                SizedBox(
                  height: AppSize.s36.h,
                ),
                _buildLineOfAcceptOurPrivacyAndTerms(context),
                SizedBox(
                  height: AppSize.s169.h,
                ),
                _buildRegisterButton(context),
                SizedBox(
                  height: AppSize.s29.h,
                ),
                const BuildOrDivider(),
                SizedBox(
                  height: AppSize.s29.h,
                ),
                const BuildGmailAndFacebookIconsSection(),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                _buildAlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
