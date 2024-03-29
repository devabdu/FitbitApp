import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF5F5F5);
  static const Color lightPrimary = Color(0xFF499395);
  static const Color darkPrimary = Color(0xFF174A51);
  static const Color subTitle = Color(0xFF7B6F72);
  static const Color title = Color(0xFF1D1617);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF525252);
  static const Color grey = Color(0xFF737477);
  static const Color grey1 = Color(0xFF7B6F72);
  static const Color grey2 = Color(0xFFADA4A5);
  static const Color grey3 = Color(0xFFDDDADA);
  static const Color lightGrey = Color(0xFF9E9E9E);
  static const Color error = Color(0xFFE61F34);
  static const Color black = Color(0xFF000000);
  static const Color black_26 = Colors.black26;
  static const Color transparent = Colors.transparent;
  static const Color formTextFieldFill = Color(0xFFF7F8F8);
  static const Color lightYellow = Color(0xFFE2E2AC);
  static const Color lightPink = Color(0xFFEEA4CE);
  static const Color purple = Color(0xFFC58BF2);
  static const Color backGroundCircleAvatar = Color(0xFFC4C4C4);
}

class AppColorsWithOpacity {
  static Color whiteOfZero = Colors.white.withOpacity(0);
}

class AppLinearGradientColors {
  static const LinearGradient mainGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.darkPrimary, AppColors.lightPrimary],
    stops: [0.0, 1.0],
  );

  static const LinearGradient iconBottomNavigation = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.lightYellow, AppColors.lightPink],
    stops: [0.0, 1.0],
  );

  static const LinearGradient circleIcon = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.purple, AppColors.lightPink],
    stops: [0.0, 1.0],
  );
}
