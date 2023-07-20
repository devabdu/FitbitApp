import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  Widget _buildFitBoyImage() {
    return SizedBox(
      width: 308.03,
      height: 236.49,
      child: Image.asset('assets/images/fit_boy3.png'),
    );
  }

  Widget _buildEmailTextFormFiled(BuildContext context) {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: AppColors.grey1,
      ),
      hintText: 'Email',
      labelText: 'Email',
      //errorText: 'Error',
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: 'Login',
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 141,
          height: 1, // Thickness
          color: Colors.grey,
        ),
        Text(
          'Or',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: 141,
          height: 1, // Thickness
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildGmailAndFacebookIcon(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          assetImage: 'assets/images/gmail_icon.svg',
        ),
        SizedBox(
          width: 30,
        ),
        CustomIconButton(
          assetImage: 'assets/images/facebook_icon.svg',
        ),
      ],
    );
  }

  Widget _buildDoNotHaveAccount(context) {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account?',
        style: const TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.s18,
            height: AppSize.s1_5),
        children: [
          TextSpan(
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () {
            //     Future.delayed(Duration.zero).then((_) {
            //       setState(() {
            //         Navigator.pushNamed(
            //             context, AppRoutesName.register_1Route);
            //       });
            //     });
            //   },
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
            text: ' Register',
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
        padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(children: [
            _buildFitBoyImage(),
            const SizedBox(
              height: 130,
            ),
            _buildEmailTextFormFiled(context),
            const SizedBox(
              height: 50,
            ),
            _buildLoginButton(context),
            const SizedBox(
              height: 29,
            ),
            _buildOrDivider(context),
            const SizedBox(
              height: 29,
            ),
            _buildGmailAndFacebookIcon(context),
            const SizedBox(
              height: 30,
            ),
            _buildDoNotHaveAccount(context),
          ]),
        ),
      ),
    ));
  }
}
