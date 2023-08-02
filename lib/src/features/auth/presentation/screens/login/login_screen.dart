import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_rich_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/features/auth/presentation/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_compination_auth_icons_and_or_divider_widget.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_email_text_form_field_widget.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/build_fit_boy_image_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final AppPharses appPharses = AppPharses();

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildDoNotHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.dontHaveAccount,
      highlightText: appPharses
          .phraseConstructionWithFirstStringEmpty(AppStrings.register),
      nextWidget: const ReigsterScreen1(),
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
              const BuildFitBoyImage(),
              SizedBox(height: mediaQuerySizeOfHeight / 7),
              BuildEmailTextFormField(textEditingController: _emailController),
              SizedBox(height: mediaQuerySizeOfHeight / 20),
              _buildLoginButton(context),
              const BuildCombinationAuthIconsAndOrDividerWidget(),
              _buildDoNotHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
