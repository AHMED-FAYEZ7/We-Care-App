import 'package:flutter/material.dart';

import '../app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
    primarySwatch: AppColorsLight.primaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColorsLight.appBarColor,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        Colors.amberAccent,
      ),
    )));
