import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitbit/src/app/dependency_injection.dart';
import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/functions/valid_functions.dart';
import 'package:fitbit/src/core/utils/helper/navigator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_progress_indicator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_snack_bar.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_rich_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/login_controller/login_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/register_controller/register_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_compination_auth_icons_and_or_divider_widget.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_fit_boy_image_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late String email;
  late String password;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final AppPharses appPharses = AppPharses();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildEmailTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        AppIcons.emailOutlined,
        color: AppColors.grey1,
      ),
      hintText: AppStrings.email,
      labelText: AppStrings.email,
      validator: (value) => Validator.validateEmail(value),
      onSaved: (newValue) => email = newValue!,
      //errorText: 'Error',
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _passwordController,
      keyBoardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(
        AppIcons.password,
        color: AppColors.grey1,
      ),
      hintText: AppStrings.password,
      labelText: AppStrings.password,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? AppIcons.visibility : AppIcons.visibilityOff,
        ),
        onPressed: _togglePasswordVisibility,
      ),
      validator: (value) => Validator.validatePassword(value),
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          navigatePushNamed(context, AppRoutesName.forgotPasswordRoute, '');
        },
        child: Text(
          AppStrings.forgotPassword,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.lightPrimary, fontWeight: AppFontWeight.medium),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        _checkValidateLogin(context);
      },
      textButton: AppStrings.login,
    );
  }

  Future<void> _checkValidateLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<LoginCubit>(context)
          .signInWithEmailAndPassword(email, password);
    }
  }

  Widget _buildSignInSubmitedBloc() {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignInLoading) {
          showProgressIndicator(context);
        }
        if (state is SignInSuccess) {
          navigatePushNamed(context, AppRoutesName.homeRoute, '');
        }
        if (state is SignInError) {
          showSnackBar(context, state.error);
        }
      },
      child: Container(
        height: AppSize.s10,
      ),
    );
  }

  Widget _buildDoNotHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.dontHaveAccount,
      highlightText: appPharses
          .phraseConstructionWithFirstStringEmpty(AppStrings.register),
      nextWidget: BlocProvider(
        create: (_) => serviceLocator<RegisterCubit>(),
        child: const ReigsterScreen1(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
            child: Column(
              children: [
                const BuildFitBoyImage(),
                SizedBox(height: mediaQuerySizeOfHeight / 15),
                _buildEmailTextFormFiled(),
                SizedBox(height: mediaQuerySizeOfHeight / 30),
                _buildPasswordTextFormFiled(),
                _buildForgotPasswordText(),
                SizedBox(height: mediaQuerySizeOfHeight / 90),
                _buildSignInSubmitedBloc(),
                _buildLoginButton(context),
                const BuildCombinationAuthIconsAndOrDividerWidget(),
                _buildDoNotHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
