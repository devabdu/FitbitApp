import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  Widget _buildFitBoyImage() {
    return SizedBox(
      width: AppSize.s308_03.w,
      height: AppSize.s236_49.h,
      child: Image.asset(AppImagesPng.fitBoy3),
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
        labelText: AppStrings.email
        //errorText: 'Error',
        );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: AppStrings.login,
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

  Widget _buildDoNotHaveAccount(context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.dontHaveAccount,
        style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.s18,
            height: AppSize.s1_5.h),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReigsterScreen1()),
                  );
                });
              },
            text: AppStrings.register,
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
                _buildFitBoyImage(),
                SizedBox(
                  height: AppSize.s130.h,
                ),
                _buildEmailTextFormFiled(context),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                _buildLoginButton(context),
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
                _buildDoNotHaveAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
