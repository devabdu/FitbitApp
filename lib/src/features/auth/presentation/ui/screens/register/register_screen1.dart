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
import 'package:fitbit/src/features/auth/presentation/controllers/register_controller/register_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/login/login_screen.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/register_screen2.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_compination_auth_icons_and_or_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReigsterScreen1 extends StatefulWidget {
  const ReigsterScreen1({super.key});

  @override
  State<ReigsterScreen1> createState() => _ReigsterScreen1State();
}

class _ReigsterScreen1State extends State<ReigsterScreen1>
    with RestorationMixin {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late String firstName;
  late String email;
  late String password;
  bool _obscureText = true;
  RestorableBoolN checkboxValue = RestorableBoolN(false);

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  String? get restorationId => 'checkbox_demo';
  final AppPharses appPharses = AppPharses();

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValue, 'checkbox');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
      validator: (value) => validateName(value),
      onSaved: (newValue) => firstName = newValue!,
    );
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
      validator: (value) => validateEmail(value),
      onSaved: (newValue) => email = newValue!,
      //errorText: 'Error',
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _passwordController,
      keyBoardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? AppIcons.visibility : AppIcons.visibilityOff,
        ),
        onPressed: _togglePasswordVisibility,
      ),
      hintText: AppStrings.password,
      labelText: AppStrings.password,
      validator: (value) => validatePassword(value),
      onSaved: (newValue) => password = newValue!,
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

  Widget _buildRegisterSubmitedBloc() {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignUpLoading) {
          showProgressIndicator(context);
        }
        if (state is SignUpSuccess) {
          navigatePop(context);
          navigateTo(
              context,
              BlocProvider(
                  create: (_) => serviceLocator<RegisterCubit>(),
                  child: RegisterScreen2(userId: (state).user.uid!)));
        }
        if (state is SignUpError) {
          String message = (state).error;
          showSnackBar(context, message);
        }
      },
      child: Container(
        height: AppSize.s45,
      ),
    );
  }

  Future<void> _checkValidateRegister(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<RegisterCubit>(context).signUpWithEmailAndPassword(
        name: firstName,
        email: email,
        password: password,
      );
    }
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () => _checkValidateRegister(context),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
            child: Column(
              children: [
                _buildWelcomeAndCreateAccountText(context),
                SizedBox(height: mediaQuerySizeOfHeight / 15),
                _buildFirstNameTextFormFiled(),
                SizedBox(height: mediaQuerySizeOfHeight / 30),
                _buildEmailTextFormFiled(),
                SizedBox(height: mediaQuerySizeOfHeight / 30),
                _buildPasswordTextFormFiled(),
                SizedBox(height: mediaQuerySizeOfHeight / 15),
                _buildLineOfAcceptOurPrivacyAndTerms(context),
                SizedBox(height: mediaQuerySizeOfHeight / 9),
                _buildRegisterSubmitedBloc(),
                _buildRegisterButton(context),
                // const BuildCombinationAuthIconsAndOrDividerWidget(),
                _buildAlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
