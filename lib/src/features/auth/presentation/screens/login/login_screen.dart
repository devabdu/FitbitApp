import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_rich_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_email_text_form_field.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_fit_boy_image.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_gmail_facebook_icons_sections.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildDoNotHaveAccount() {
    return const CustomRichText(
      mainText: AppStrings.dontHaveAccount,
      highlightText: AppStrings.register,
      nextWidget: ReigsterScreen1(),
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
                const BuildFitBoyImage(),
                SizedBox(
                  height: AppSize.s130.h,
                ),
                BuildEmailTextFormField(
                    textEditingController: _emailController),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                _buildLoginButton(context),
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
                _buildDoNotHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
