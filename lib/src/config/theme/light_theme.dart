import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

ThemeData appLightTheme() {
  return ThemeData(
    primaryColor: AppColors.lightPrimary,
    primaryColorLight: AppColors.lightPrimary,
    primaryColorDark: AppColors.darkPrimary,

    //hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppFont.fontFamily,

    /// appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.lightPrimary,
      elevation: AppSize.s4,
      shadowColor: AppColors.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: AppFontSize.s16,
        color: AppColors.white,
      ),
    ),

    /// cardView theme
    cardTheme: const CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
      elevation: AppSize.s4,
    ),

    /// button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: AppColors.grey1,
      //buttonColor: AppColors.primary,
      splashColor: AppColors.lightPrimary,
    ),

    /// elevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: AppColors.white,
          fontSize: AppFontSize.s17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        fontSize: AppFontSize.s16,
        color: AppColors.darkGrey,
      ),
      headlineLarge: getSemiBoldStyle(
        fontSize: AppFontSize.s16,
        color: AppColors.darkGrey,
      ),
      headlineMedium: getRegularStyle(
        fontSize: AppFontSize.s14,
        color: AppColors.darkGrey,
      ),
      titleLarge: getLargeStyle(
        color: const Color(0xFF1D1617),
        fontSize: AppFontSize.s26,
      ),
      titleMedium: getRegularStyle(
        color: AppColors.subTitle,
        fontSize: AppFontSize.s16,
      ),
      titleSmall: getRegularStyle(
        fontSize: AppFontSize.s14,
        color: AppColors.title,
      ),
      labelSmall: getBoldStyle(
        fontSize: AppFontSize.s12,
        color: AppColors.lightPrimary,
      ),
      bodyMedium: getRegularStyle(
        fontSize: AppFontSize.s12,
        color: AppColors.grey2,
      ),
      bodyLarge: getBoldStyle(
        color: AppColors.title,
        fontSize: AppFontSize.s20,
      ),
      bodySmall: getRegularStyle(color: AppColors.grey),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.grey3.withOpacity(0.4),
      filled: true,
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        fontSize: AppSize.s14,
        color: AppColors.grey2,
      ),
      labelStyle: getMediumStyle(
        fontSize: AppSize.s14,
        color: AppColors.grey2,
      ),
      errorStyle: getRegularStyle(
        fontSize: AppSize.s14,
        color: AppColors.error,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey3,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s14),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightPrimary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s14),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s14),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightPrimary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s14),
        ),
      ),
    ),
  );
}
