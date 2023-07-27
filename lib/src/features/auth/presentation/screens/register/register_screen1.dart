import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_icon_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/screens/login/login_screen.dart';

import 'package:flutter/gestures.dart';
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

  Widget _buildFirstNameTextFormFiled(BuildContext context) {
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

  Widget _buildEmailTextFormFiled(BuildContext context) {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        AppIcons.emailOutlined,
        color: AppColors.grey1,
      ),
      hintText: AppStrings.email,
      labelText: AppStrings.email,
      //errorText: 'Error',
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

  Widget _buildOrDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: AppSize.s141.w,
          height: AppSize.s1.h,
          color: Colors.grey,
        ),
        Text(
          AppStrings.or,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: AppSize.s141.w,
          height: AppSize.s1.h,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildGmailAndFacebookIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIconButton(
          assetImage: AppImagesSvg.gmailLogo,
        ),
        SizedBox(
          width: AppSize.s30.w,
        ),
        const CustomIconButton(
          assetImage: AppImagesSvg.facebookLogo,
        ),
      ],
    );
  }

  Widget _buildAlreadyHaveAccount(context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.alreadyHaveAccount,
        style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.s18,
            height: AppSize.s1_5.h),
        children: <TextSpan>[
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                });
              },
            text: AppStrings.login,
            style: const TextStyle(
              color: Colors.purple,
            ),
          ),
        ],
      ),
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
                _buildFirstNameTextFormFiled(context),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                _buildEmailTextFormFiled(context),
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
                _buildOrDivider(context),
                SizedBox(
                  height: AppSize.s29.h,
                ),
                _buildGmailAndFacebookIcon(context),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                _buildAlreadyHaveAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutesName.loginRoute);
  }
}
