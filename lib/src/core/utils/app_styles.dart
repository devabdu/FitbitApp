import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: AppFont.fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

/// bold style
TextStyle getBoldStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.bold, color);
}

/// semiBold style
TextStyle getSemiBoldStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.semiBold, color);
}

/// large style
TextStyle getLargeStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.bold, color);
}

/// medium style
TextStyle getMediumStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.medium, color);
}

/// regular style
TextStyle getRegularStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.regular, color);
}

/// light style
TextStyle getLightStyle({
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, AppFontWeight.light, color);
}
