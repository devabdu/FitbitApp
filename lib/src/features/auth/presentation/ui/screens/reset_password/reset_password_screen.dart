import 'package:fitbit/src/core/utils/functions/valid_functions.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitbit/src/features/auth/presentation/controllers/login_controller/login_cubit.dart';

import '../../../../../../core/utils/helper/navigator.dart';
import '../../../../../../core/utils/helper/show_components/show_progress_indicator.dart';
import '../../../../../../core/utils/helper/show_components/show_snack_bar.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
    );
  }

  Widget _buildResetPasswordSubmitedBloc() {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showProgressIndicator(context);
        }
        if (state is ResetPasswordSuccess) {
          showSnackBar(
              context, 'Password reset instructions have been sent to email!');
          navigatePop(context);
        }
        if (state is ResetPasswordError) {
          showSnackBar(context, state.error);
        }
      },
      child: Container(
        height: AppSize.s10,
      ),
    );
  }

  Future<void> _checkValidateEmail(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<LoginCubit>(context)
          .forgotPassword(_emailController.text.trim());
    }
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        _checkValidateEmail(context);
      },
      textButton: AppStrings.resetPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text(AppStrings.resetPassword),
          isWithoutActions: true,
        ),
        body: Padding(
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildEmailTextFormFiled(),
                SizedBox(height: mediaQuerySizeOfHeight / 30),
                _buildResetPasswordSubmitedBloc(),
                _buildResetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
