import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
void navigatePop(context) => Navigator.pop(context);

void navigatePushNamed(context, namewidget, Object? arguments) =>
    Navigator.pushNamed(
      context,
      namewidget,
      arguments: arguments,
    );

void navigatePushReplacment(context, routeName) =>
    Navigator.pushReplacementNamed(context, routeName);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
      (route) => false,
    );
